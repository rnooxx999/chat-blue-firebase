class MyUser {
  static const String collectionName = 'users';
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;

  MyUser({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
  });

  //User.fromJson(Map<String , dynamic> json) :this{

  MyUser.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = userName;
    map['email'] = email;
    return map;
  }
}
