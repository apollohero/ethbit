import 'package:json_annotation/json_annotation.dart';
import "wallet.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
    User();
    int id;
    String nickname;
    String mobile;
    int sex;
    String levelName;
    String inviteCode;
    bool havePayPwd;



    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}