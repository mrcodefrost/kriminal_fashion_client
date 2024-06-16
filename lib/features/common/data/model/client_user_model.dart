import 'package:json_annotation/json_annotation.dart';

part 'client_user_model.g.dart';

@JsonSerializable()
class ClientUser {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "number")
  int? number;

  @JsonKey(name: "email")
  String? email;

  ClientUser({
    this.id,
    this.name,
    this.number,
    this.email,
  });

  factory ClientUser.fromJson(Map<String, dynamic> json) =>
      _$ClientUserFromJson(json);
  Map<String, dynamic> toJson() => _$ClientUserToJson(this);
}
