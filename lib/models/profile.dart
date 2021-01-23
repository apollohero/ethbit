import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "wallet.dart";
import "promote.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
    

    Profile();

    User user;
    Wallet wallet;
    Promote promote;
    String token;
    String grade;
    String company_usdt_address;
    num usdt_price;
    num favor_price;
    num favor_total;
    num favor_ratio;
    String explain_charge;
    String explain_favor;
    String explain_register;
    num theme;
    String lastLogin;
    String locale;
    String status;
    
    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
