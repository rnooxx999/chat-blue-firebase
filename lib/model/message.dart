import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/intl.dart';

class Message {
  static const String collectionName = "message";

  String id;

  String roomId;
  String content;
  String senderId;
  String senderName;
  int dateTime;

  Message({
    this.id = "",
    required this.roomId,
    required this.content,
    required this.senderId,
    required this.senderName,
    required this.dateTime,
  });

  Message.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] as String,
            roomId: json['room_id'] as String,
            senderName: json['sender_name'] as String,
            senderId: json['sender_id'] as String,
            content: json['content'] as String,
            dateTime: json['date_time'] as int);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'room_id': roomId,
      'sender_name': senderName,
      'date_time': dateTime,
      'content': content,
    };
  }

  String dfo() {
    // FirebaseFirestore
    Timestamp t0 = Timestamp(dateTime, 0);
    DateTime d = t0.toDate();
    var t = (DateFormat.yMMMMd().format(d));
    //  var dat = DateTime.parse(dateTime)
    // print("time : $dat");
    // var da  = Timestamp(dateTime , 0);
    var datte = t.toString();

    final year = int.parse(datte.substring(0, 4));
    final month = int.parse(datte.substring(5, 7));
    final day = int.parse(datte.substring(8, 10));
    final hour = int.parse(datte.substring(11, 13));
    final minute = int.parse(datte.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return dateTime.toString();
  }

  String dateFormatter() {
    //String roughTimeString = DateFormat('date_time').format(dateTime);
    var datee = DateTime(dateTime);
    // var _dateTime = DateTime.now().subtract(const Duration(minutes: 10));
    // final _houAgo = DateTime.now().subtract(Duration(hours: DateFormat.HOUR.));
    final _minutsAgo = DateTime.now().subtract(Duration(minutes: datee.minute));
    var time1 = DateFormat(dateTime.toString()).add_j();
    var time2 = DateFormat(dateTime.toString()).dateSymbols;
    // var time3= DateFormat(dateTime.toString()).add_H(DateFormat.HOUR);
    var time4 = DateFormat(dateTime.toString()).add_jmv();
    var time5 = DateFormat(dateTime.toString()).add_ms();

    print("time1 $time1 \n time2 : $time2 \n time3 $time4 \n time3 $time5");

    var resultMe = GetTimeAgo.parse(
      _minutsAgo,
      //pattern: "hh:mm aa",
    );

    //var result = GetTimeAgo.parse(_minutsAgo);
    //var result2 = GetTimeAgo.parse(_seAgo);

    //
    // print("hhhhhhhhhhhhhhhh : ${datee.hour.toInt()}");
    //
    // if (datee.hour.toInt() < 1 ) {
    //   return resultMe;
    // }
    // else if (datee.hour.toInt() < 1 || datee.minute =="01") {
    //   return resultMe;
    // }

    return resultMe;

    //  if (!localDateTime.difference(justNow).isNegative) {
    //  //   return 'Just now';
    //  // }
    //
    // // else return now.millisecondsSinceEpoch.toString();

    // }
  }
}