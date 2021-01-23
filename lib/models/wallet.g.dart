 

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet()
    ..wallet_id = json['wallet_id'] as String
    ..user_id = json['user_id'] as String
    ..usdt_balance = json['usdt_balance'] as num
    ..fil_balance = json['fil_balance'] as num
    ..lamb_balance = json['lamb_balance'] as num
    ..userUserId = json['userUserId'] as String
    ..user_space_num = json['user_space_num'] as num;

}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'wallet_id': instance.wallet_id,
      'user_id': instance.user_id,
      'usdt_balance': instance.usdt_balance,
      'fil_balance': instance.fil_balance,
      'lamb_balance': instance.lamb_balance,
      'user_space_num': instance.user_space_num,
      'userUserId': instance.userUserId,
    };