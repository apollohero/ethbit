// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()

    ..id = json['id'] as int
    ..nickname = json['nickname'] as String
    ..mobile = json['mobile'] as String
    ..sex = json['sex'] as int
    ..levelName = json['levelName'] as String
    ..inviteCode = json['inviteCode'] as String
    ..havePayPwd = json['havePayPwd'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'nickname': instance.nickname,
  'mobile': instance.mobile,
  'sex': instance.sex,
  'levelName': instance.levelName,
  'inviteCode': instance.inviteCode,
  'havePayPwd': instance.havePayPwd,
};