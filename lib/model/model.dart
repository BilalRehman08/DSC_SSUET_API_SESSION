class Users {
  late int id;
  late String name;
  late String username;
  late String email;
  late String phone;
  late String website;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  static List<Users> fromJsonList(List<dynamic> jsonLst) {
    List<Users> users = [];
    jsonLst.forEach((user) {
      users.add(Users.fromJson(user));
    });
    return users;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    return data;
  }
}
