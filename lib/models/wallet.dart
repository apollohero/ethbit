import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
    Wallet();

    String wallet_id;
    String user_id;
    num usdt_balance;
    num fil_balance;
    num lamb_balance;
    num user_space_num;
    String userUserId;

    
    factory Wallet.fromJson(Map<String,dynamic> json) => _$WalletFromJson(json);
    Map<String, dynamic> toJson() => _$WalletToJson(this);
}