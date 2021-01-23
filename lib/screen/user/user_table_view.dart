import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto_template/api_client_new.dart';
import 'package:crypto_template/app_global.dart';
import 'package:crypto_template/widget/template_view_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:crypto_template/screen/intro/login.dart';

// 直属会员
// 直属会员
// 直属会员
// 直属会员
// 直属会员

class MyMembers extends StatefulWidget {
  ThemeBloc themeBloc;
  @override
  createState() => new RouteState();
}

class RouteState extends State {

  String user_id = '';
  int user_space_num;
  int number;
  List TitleData = ["直推成员名称", "成员手机号","创建时间"];
  var DataList = [];
  int totalActive = 0;
  ThemeBloc themeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeData();
    _getTotal();
  }




  Future<String> _changeData() async {
    // Future<String> token = _checkLogin();
    // token.then((token) async {
    ApiClient client = new ApiClient();
    await client.getMyMembers(AppGlobal.profile.token).then((response) async{
      print(response);
      if (response.data["code"] == 0 ){
        Map<String, dynamic> map = json.decode(response.toString());

        ChangeData(map);

      }else {
        showDialog(
            context: context,
            child: new AlertDialog(
              content: new Text(response.data['msg']),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('Token');
                      prefs.remove('profile');
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new login(themeBloc: themeBloc)));

                    },
                    child: new Text('好'))
              ],
            ));
      }

    });
    // });
  }

  Future<String> _getTotal() async {
//    ApiClient client = new ApiClient();
//    await client.getTotalMembers(AppGlobal.profile.token,AppGlobal.profile.user.path).then((response) {
//
//      Map<String, dynamic> map = json.decode(response.toString());
//
//      setState(() {
//        totalActive = map["data"];
//      });
//    });
  }

  void ChangeData(data) {
    var _dataList = [];
    String name = '';
    String phone;
    int coke;
    String time;
    for (var i = 0; i < data['data'].length; i++) {
      name = data["data"]["pathTeam"]["list"][i]['nickname'];
      phone = data["data"]["pathTeam"]["list"][i]["mobile"];
      time = data["data"]["pathTeam"]["list"][i]["created_at"];
      time = time.substring(0,10);
      print(time);
      _dataList.add({'$name', "$phone", "$time"});
    }
    setState(() {
      DataList = _dataList;
      totalActive = data["data"]["active"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "团队成员 - 激活总人数：${totalActive}人",
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: RefreshIndicator(
              onRefresh: _changeData,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: TemplateViewList(
                  Data: {
                    "TitleData": TitleData,
                    "DataList": DataList,
                  },
                ),
              ),
            )
        )

    );
  }
}