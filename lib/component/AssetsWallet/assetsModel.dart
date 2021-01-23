class assetsWallet {
   String icon,name,pairValue,priceValue;
  assetsWallet({this.icon,this.name,this.pairValue,this.priceValue});
}

List<assetsWallet> assetsWalletList = [
  assetsWallet(
    icon: "assets/image/market/bitcoin.png",
    name: "BTC",
    pairValue: "0",
    priceValue: "0.00",
  ),
  assetsWallet(
    icon: "assets/image/market/eth.png",
    name: "ETH",
    pairValue: "0",
    priceValue: "0.00",
  ),
  assetsWallet(
    icon: "assets/image/market/usdt.png",
    name: "USDT",
    pairValue: "0",
    priceValue: "0.00",
  ),
  assetsWallet(
    icon: "assets/image/market/dot.png",
    name: "DOT",
    pairValue: "0",
    priceValue: "0.00",
  ),
  assetsWallet(
    icon: "assets/image/market/fil.png",
    name: "FIL",
    pairValue: "0",
    priceValue: "0.00",
  ),
];