import 'package:flutter/material.dart';

class withDraw extends StatefulWidget {
  final Widget child;

  withDraw({Key key, this.child}) : super(key: key);

  _withDrawState createState() => _withDrawState();
}

class _withDrawState extends State<withDraw> {
   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
         children: <Widget>[
           Container(
             width: double.infinity,
             height: 100.0,
             decoration: BoxDecoration(
               color: Theme.of(context).canvasColor,
               borderRadius: BorderRadius.all(Radius.circular(10.0))
             ),
             child: Column(
               children: <Widget>[
           Padding(
             padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 19.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("可用余额 (AUFI)",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.5),fontFamily: "Popins",fontSize: 15.5),),
                 Text("0",style: TextStyle(fontFamily: "Popins"),),
               ],
             ),
           ),
             Padding(
             padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("处理中 (AUFI)",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.5),fontFamily: "Popins",fontSize: 15.5),),
                 Text("0",style: TextStyle(fontFamily: "Popins",color: Theme.of(context).hintColor.withOpacity(0.5),),),
               ],
             ),
           ),
               ],
             ),
           ),
           SizedBox(
             height: 20.0,
           ),
           Container(
             height:355.0,
             width: double.infinity, 
             decoration: BoxDecoration(
               color: Theme.of(context).canvasColor,
               borderRadius: BorderRadius.all(Radius.circular(10.0))
             ),
             child: Padding(
               padding: const EdgeInsets.only(left:18.0,right: 18.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(height: 27.0,),
           Text("AUFI 提币地址",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.7),fontFamily: "Popins",),),
            Padding(
              padding: const EdgeInsets.only(right:5.0,bottom: 35.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "粘贴你的提币地址",
                  hintStyle: TextStyle(color: Theme.of(context).hintColor,fontFamily: "Popins",fontSize: 15.0)
                ),
              ),
            ),

             Text("数量",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.7),fontFamily: "Popins",),),
            TextField(
                    decoration: InputDecoration(
                      hintText: "0",
                      hintStyle: TextStyle(color: Theme.of(context).hintColor,fontFamily: "Popins",fontSize: 15.0)
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("24H 提币限额: 2 BTC",style: TextStyle(color: Theme.of(context).hintColor,fontFamily: "Popins",fontSize: 12.0),),
                  ),

                  SizedBox(height: 15.0,),
                    Text("手续费",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.7),fontFamily: "Popins",),),
            TextField(
                    decoration: InputDecoration(
                      hintText: "0.001AUFI",
                      hintStyle: TextStyle(color: Theme.of(context).hintColor,fontFamily: "Popins",fontSize: 15.0)
                    ),
                  ),
                 ],
               ),
             ),
           ),
           SizedBox(height: 20.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text("Received Amount",style: TextStyle(color: Theme.of(context).hintColor),),
               Text("-0.001 AUFI",style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.7)),)
             ],
           ),
           SizedBox(height: 5.0,),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text("Withdraw",style: TextStyle(fontFamily: "Popins",fontSize: 16.0,letterSpacing: 1.5,fontWeight: FontWeight.w700),),
            ),
            ),
           SizedBox(height: 20.0,)
         ],
      ),
    );
  }
}