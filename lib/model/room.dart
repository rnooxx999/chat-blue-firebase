class RoomModel {
  static const String collectionName = 'rooms';

  String? roomId;
  String? title;
  String? description;
  String? categoryId;

  RoomModel(
      {required this.roomId,
      required this.title,
      required this.description,
      required this.categoryId});

  RoomModel.fromJson(dynamic json) {
    roomId = json['room_id'];
    title = json['title'];
    description = json['description'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['room_id'] = roomId;
    map['title'] = title;
    map['description'] = description;
    map['category_id'] = categoryId;
    return map;
  }
}
