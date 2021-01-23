import 'package:flutter/material.dart';

class btcMarket {
  String icon,name,pairValue,priceValue,priceDollar,percent;
  Color colorChg;
  btcMarket({this.icon,this.name,this.pairValue,this.percent,this.priceDollar,this.priceValue,this.colorChg});
}

List<btcMarket> btcMarketList = [
  btcMarket(
    icon: "assets/image/market/bitcoin.png",
    name: "BTC",
    pairValue: "1.0",
    priceValue: "32432",
    priceDollar: "\$0.1358",
    percent: "+1.87%",
    colorChg: Colors.green
  ),
  btcMarket(
    icon: "assets/image/market/eth.png",
    name: "ETH",
      pairValue: "1.0",
    priceValue: "1400",
    priceDollar: "\$65.5132",
    percent: "-0.18%",
    colorChg: Colors.red
  ),

  btcMarket(
    icon: "assets/image/market/dot.png",
    name: "DOT",
    pairValue: "1.0",
    priceValue: "0.0364231",
    priceDollar: "\$137.539122",
    percent: "+1.36%",
    colorChg: Color(0xFF00C087)
  ),
  btcMarket(
    icon: "assets/image/market/fil.png",
    name: "FIL",
    pairValue: "1.0",
    priceValue: "0.0064231",
    priceDollar: "\$9.129122",
    percent: "+0.36%",
    colorChg: Color(0xFF00C087)
  ),
];