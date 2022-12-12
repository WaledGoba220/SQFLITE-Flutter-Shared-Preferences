class UserModel {
  String? name, email;
  int? age;

  UserModel({this.name, this.email, this.age});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    email = map["email"];
    age = map["age"];
  }
  toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
    };
  }
}
