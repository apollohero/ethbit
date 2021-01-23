import 'package:json_annotation/json_annotation.dart';

part 'mwallet.g.dart';

@JsonSerializable()
class Mwallet {
    Mwallet();

    num market_wallet_usdt;
    num market_wallet_fil;
    num market_wallet_lamb;
    num market_reward_space_num;
    num market_relate_total_space_num;
    
    factory Mwallet.fromJson(Map<String,dynamic> json) => _$MwalletFromJson(json);
    Map<String, dynamic> toJson() => _$MwalletToJson(this);
}
