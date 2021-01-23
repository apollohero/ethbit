import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class application extends StatefulWidget {
  final Widget child;

  application({Key key, this.child}) : super(key: key);

  _marketState createState() => _marketState();
}

class _marketState extends State<application> with SingleTickerProviderStateMixin {


  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4,vsync: this,initialIndex: 1);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
                child: Text(
                  "应用",
                  style: TextStyle(
                      fontFamily: "Sans",
                      fontSize: 19.5,
                      fontWeight: FontWeight.w700),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height:MediaQuery.of(context).size.height - 170,
              child:
              WebView(
                initialUrl: "http://baidu.com",

              ),
            )
          ),

        ],
      ),
    );
  }
}

