// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mwallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mwallet _$MwalletFromJson(Map<String, dynamic> json) {
  return Mwallet()
    ..market_wallet_usdt = json['market_wallet_usdt'] as num
    ..market_wallet_fil = json['market_wallet_fil'] as num
    ..market_wallet_lamb = json['market_wallet_lamb'] as num
    ..market_reward_space_num = json['market_reward_space_num'] as num
    ..market_relate_total_space_num =
        json['market_relate_total_space_num'] as num;
}

Map<String, dynamic> _$MwalletToJson(Mwallet instance) => <String, dynamic>{
      'market_wallet_usdt': instance.market_wallet_usdt,
      'market_wallet_fil': instance.market_wallet_fil,
      'market_wallet_lamb': instance.market_wallet_lamb,
      'market_reward_space_num': instance.market_reward_space_num,
      'market_relate_total_space_num': instance.market_relate_total_space_num
    };
