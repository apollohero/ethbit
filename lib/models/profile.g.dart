// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..wallet = json['wallet'] == null
        ? null
        : Wallet.fromJson(json['wallet'] as Map<String, dynamic>)
    ..promote = json['promote'] == null
        ? null
        : Promote.fromJson(json['promote'] as Map<String, dynamic>)
    ..token = json['token'] as String
    ..company_usdt_address = json['walletList'] as String
    ..usdt_price = json['usdt_price'] as num
    ..favor_price = json['favor_price'] as num
    ..favor_total = json['favor_total'] as num
    ..favor_ratio = json['favor_ratio'] as num
    ..explain_charge = json['explain_charge'] as String
    ..explain_favor = json['explain_favor'] as String
    ..explain_register = json['explain_cregister'] as String
    ..theme = json['theme'] as num
    ..lastLogin = json['lastLogin'] as String
    ..locale = json['locale'] as String
    ..status = json['status'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'wallet': instance.wallet,
      'promote': instance.promote,
      'token': instance.token,
      'company_usdt_address': instance.company_usdt_address,
      'usdt_price': instance.usdt_price,
      'favor_price': instance.favor_price,
      'favor_total': instance.favor_total,
      'favor_ratio': instance.favor_ratio,
      'explain_register': instance.explain_register,
      'explain_favor': instance.explain_favor,
      'explain_charge': instance.explain_charge,
      'theme': instance.theme,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
      'status': instance.status
    };
