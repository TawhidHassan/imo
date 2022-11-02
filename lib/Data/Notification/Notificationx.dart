// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Notificationx.g.dart';

@JsonSerializable()
class Notificationx{

  @JsonKey(name: "_id")
  String? id;
  String? employeeId;
  String? phoneNumber;
  String? name;
  num? flag;
  bool? isAssigned;
  String? email;
  String? role;
  String? image;


  Notificationx(this.id, this.employeeId, this.phoneNumber, this.name, this.flag,
      this.isAssigned, this.email, this.role, this.image);

  factory Notificationx.fromJson(Map<String,dynamic>json)=>
      _$NotificationxFromJson(json);
  Map<String,dynamic>toJson()=>_$NotificationxToJson(this);
}