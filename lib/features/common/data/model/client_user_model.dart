class ClientUser {
  String? id;
  String? name;
  int? number;
  String? email;

  ClientUser({this.id, this.name, this.number, this.email});

  factory ClientUser.fromJson(Map<String, dynamic> json) {
    return ClientUser(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['email'] = email;
    return data;
  }
}
