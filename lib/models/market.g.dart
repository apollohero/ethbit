// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) {
  return Market()
    ..team_people_num = json['team_people_num'] as num
    ..total_space_num = json['total_space_num'] as num
    ..department_num = json['department_num'] as num
    ..market_id = json['market_id'] as String
    ..market_name = json['market_name'] as String
    ..market_account = json['market_account'] as String
    ..is_closed = json['is_closed'] as String
    ..market_reward_space_num = json['market_reward_space_num'] as num
    ..market_relate_total_space_num =
        json['market_relate_total_space_num'] as num
    ..market_wallet = json['market_wallet'] == null
        ? null
        : Mwallet.fromJson(json['market_wallet'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'team_people_num': instance.team_people_num,
      'total_space_num': instance.total_space_num,
      'department_num': instance.department_num,
      'market_id': instance.market_id,
      'market_name': instance.market_name,
      'market_account': instance.market_account,
      'is_closed': instance.is_closed,
      'market_reward_space_num': instance.market_reward_space_num,
      'market_relate_total_space_num': instance.market_relate_total_space_num,
      'market_wallet': instance.market_wallet
    };
