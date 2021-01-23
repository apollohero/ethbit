// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promote _$PromoteFromJson(Map<String, dynamic> json) {
  return Promote()
    ..people = json['people'] as num
    ..usdt_reward_sum = json['usdt_reward_sum'] as num
    ..people_space = json['people_space'] as num
    ..order_list = json['order_list'] as List;
}

Map<String, dynamic> _$PromoteToJson(Promote instance) => <String, dynamic>{
      'people': instance.people,
      'usdt_reward_sum': instance.usdt_reward_sum,
      'people_space': instance.people_space,
      'order_list': instance.order_list
    };
