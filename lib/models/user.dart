class User {
  final String? id;
  final String? name;
  final String? type;
  final String? email;
  final String? date;

  User({this.id, this.name, this.type, this.email, this.date});

  factory User.fromJson(List<dynamic> json) {
    return User(
      id: json[0],
      name: json[1],
      type: json[2],
      email: json[3],
      date: json[4],
    );
  }
}
