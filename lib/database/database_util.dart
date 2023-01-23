import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message.dart';

//USER
//اضافة كوليكشن اليوزر + تسجيل الدخول و التسجيل جديد

class DataBaseUtil {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: ((snapshot, options) =>
                MyUser.fromJson(snapshot.data()!)),
            toFirestore: ((user, options) => user.toJson()));
  }

  static Future<void> registerUser(MyUser user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> loginUser(String userId) async {
    var document = await getUserCollection().doc(userId).get();
    //sharedPreferences.setString("name" , document.data()!.firstName);
    return document.data();
  }

  //***************************************************************

  //Room
  // اضافة كوليكشن جديد للروم ثم وضعها في ستريم ليستقبل اي تحديث جديد لغرفة جديدة
  static CollectionReference<RoomModel> getRoomCollection() {
    return FirebaseFirestore.instance
        .collection(RoomModel.collectionName)
        .withConverter<RoomModel>(
            fromFirestore: ((snapshot, options) =>
                RoomModel.fromJson(snapshot.data()!)),
            toFirestore: ((room, options) => room.toJson()));
  }

  static Future<void> addRoomFireBase(RoomModel room) async {
    var document = await getRoomCollection().doc();
    room.roomId = document.id;
    return document.set(room);
  }

  static Stream<QuerySnapshot<RoomModel>> getRooms() {
    return getRoomCollection().snapshots();
  }

  //***************************************************************

//Message :
// اضافة كولكشن المسج بداخل كوليكشن الروم حيث علينا جلب نسخة من الروم اولا ..
  static CollectionReference<Message> getMessageCollection(String roomId) {
    return FirebaseFirestore.instance
        .collection(RoomModel.collectionName)
        .doc(roomId)
        .collection(Message.collectionName)
        .withConverter<Message>(
            fromFirestore: ((snapshot, options) =>
                Message.fromJson(snapshot.data()!)),
            toFirestore: (message, options) => message.toJson());
  }

  static Future<void> insertMessage(Message message) async {
    var messageCollection = getMessageCollection(message.roomId);
    var doc = messageCollection.doc();
    message.id = doc.id;
    return doc.set(message);
  }

  static Stream<QuerySnapshot<Message>> getMeessageFromFirebase(String roomId) {
    return getMessageCollection(roomId).orderBy('date_time').snapshots();
  }
}
