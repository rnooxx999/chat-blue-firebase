class MyUser {
  static const String collectionName = 'users';
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;

  MyUser({
    this.id = " ",
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });

  //User.fromJson(Map<String , dynamic> json) :this{

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] as String,
            firstName: json['first_name'] as String,
            lastName: json['last_name'] as String,
            userName: json['username'] as String,
            email: json['email'] as String);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': userName,
      'email': email,
    };
  }
}