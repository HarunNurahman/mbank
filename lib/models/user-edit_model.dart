class UserEditModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditModel({this.name, this.username, this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
