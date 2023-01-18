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
            dateTime: json['dateTime'] as int);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'room_id': roomId,
      'sender_name': senderName,
      'dateTime': dateTime,
      'content': content,
    };
  }
}
