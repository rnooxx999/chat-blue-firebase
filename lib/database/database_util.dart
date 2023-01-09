import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtil {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: ((snapshot, options) =>
                MyUser.fromJson(snapshot.data())),
            toFirestore: ((user, options) => user.toJson()));
  }

  static Future<void> registerUser(MyUser user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> loginUser(String userId) async {
    var document = await getUserCollection().doc(userId).get();
    return document.data();
  }
}
