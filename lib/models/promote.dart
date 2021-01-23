import 'package:json_annotation/json_annotation.dart';

part 'promote.g.dart';

@JsonSerializable()
class Promote {
    Promote();

    num people;
    num usdt_reward_sum;
    num people_space;
    List order_list;
    
    factory Promote.fromJson(Map<String,dynamic> json) => _$PromoteFromJson(json);
    Map<String, dynamic> toJson() => _$PromoteToJson(this);
}
