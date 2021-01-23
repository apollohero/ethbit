import 'package:json_annotation/json_annotation.dart';
import "mwallet.dart";
part 'market.g.dart';

@JsonSerializable()
class Market {
    Market();

    num team_people_num;
    num total_space_num;
    num department_num;
    String market_id;
    String market_name;
    String market_account;
    String is_closed;
    num market_reward_space_num;
    num market_relate_total_space_num;
    Mwallet market_wallet;
    
    factory Market.fromJson(Map<String,dynamic> json) => _$MarketFromJson(json);
    Map<String, dynamic> toJson() => _$MarketToJson(this);
}
