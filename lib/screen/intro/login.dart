import 'dart:async';

import 'package:crypto_template/api_client_new.dart';
import 'package:crypto_template/app_global.dart';
import 'package:crypto_template/component/style.dart';
import 'package:crypto_template/models/index.dart';
import 'package:crypto_template/screen/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:crypto_template/screen/intro/signup.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class login extends StatefulWidget {
  ThemeBloc themeBloc;
  login({this.themeBloc});
  @override
  _loginState createState() => _loginState(themeBloc);
}

class _loginState extends State<login> {
  ThemeBloc _themeBloc;
  _loginState(this._themeBloc);
  @override
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String phone, password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,

          /// Set Background image in splash screen layout (Click to open code)
          decoration: BoxDecoration(color: colorStyle.background),
          child: Stack(
            children: <Widget>[
              ///
              /// Set image in top
              ///
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: mediaQuery.padding.top + 220.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/image/logo.png", height: 35.0),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 17.0, top: 7.0),
                              child: Text(
                                "以比特",
                                style: TextStyle(
                                    fontFamily: "Sans",
                                    color: Colors.white,
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 3.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 40.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 53.5,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                  color: colorStyle.primaryColor,
                                  width: 0.15,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, top: 10.0),
                                child: Theme(
                                  data:
                                  ThemeData(hintColor: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return '请输入手机号/邮箱 ';
                                        }
                                      },
                                      onSaved: (input) => phone = input,
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(
                                              Icons.account_circle,
                                              color: colorStyle.primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: '手机号/邮箱',
                                          hintStyle:
                                          TextStyle(color: Colors.white),
                                          labelStyle: TextStyle(
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 53.5,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                //              color: Color(0xFF282E41),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                  color: colorStyle.primaryColor,
                                  width: 0.15,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, top: 10.0),
                                child: Theme(
                                  data:
                                  ThemeData(hintColor: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return '请输入密码';
                                        }
                                      },
                                      onSaved: (input) => password = input,
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      controller: _passwordController,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      obscureText: true,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(
                                              Icons.vpn_key,
                                              size: 20,
                                              color: colorStyle.primaryColor,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: '密码',
                                          hintStyle:
                                          TextStyle(color: Colors.white),
                                          labelStyle: TextStyle(
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///
                      /// forgot password
                      ///
//                      Padding(
//                        padding: const EdgeInsets.only(right: 23.0, top: 9.0),
//                        child: InkWell(
//                            onTap: () {
//                              Navigator.of(context).pushReplacement(
//                                  PageRouteBuilder(
//                                      pageBuilder: (_, __, ___) =>
//                                          forgetPassword(
//                                            themeBloc: _themeBloc,
//                                          )));
//                            },
//                            child: Align(
//                                alignment: Alignment.centerRight,
//                                child: Text(
//                                  "忘记密码",
//                                  style: TextStyle(
//                                    color: Colors.white70,
//                                    fontSize: 12.0,
//                                  ),
//                                ))),
//                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 40.0),
                        child: GestureDetector(
                          onTap: () {
                            final formState = _formKey.currentState;

                            if (formState.validate()) {
                              formState.save();
                              _MySubmit(context);
                            }
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(0.0)),
                              color: colorStyle.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "登入",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(PageRouteBuilder(
                                pageBuilder: (_, __, ___) => new signUp(
                                  themeBloc: _themeBloc,
                                )));
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(0.0)),
                              border: Border.all(
                                color: colorStyle.primaryColor,
                                width: 0.35,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "注册账号",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 16.5,
                                    letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ),
                      ),
//                  Padding(
//                    padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 15.0),
//                    child: Container(width: double.infinity,height: 0.15,color: colorStyle.primaryColor,),
//                  ),
//                  Text("Register",style: TextStyle(color: colorStyle.primaryColor,fontSize: 17.0,fontWeight: FontWeight.w800),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _MySubmit(context) {
    if (phone != null && password != null) {
      // 链接登录接口
      _login(context);
    } else {
      MyShowDialog(context, "手机号/邮箱和密码不能为空！");
    }
  }

  void _login(context) async {
    EasyLoading.show(status: '登入中，请稍后...',maskType:EasyLoadingMaskType.black );
    SharedPreferences prefs = await SharedPreferences.getInstance(); // 持久数据创建
    ApiClient client = new ApiClient();

    phone.isEmpty
        ? MyShowDialog(context, "手机号/邮箱不能为空!")
        : password.isEmpty == ""
        ? MyShowDialog(context, "密码不能为空！")
        : "";

    // 简单判断是否手机号不对
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    RegExp email = new RegExp(
        r"^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
    var isPhone = mobile.hasMatch(phone);
    var isEmail = email.hasMatch(phone);
    if (!isPhone && !isEmail) {
      MyShowDialog(context, "手机号/邮箱不正确!");
      return;
    }
    if (isPhone){
      await client.loginWithPhone(phone, password).then((response) {

        if (response.data['code'] != 500) {
          String token = response.data['data'];

          prefs.setString('Token', token); // 存储到持久层。
          AppGlobal.profile.token = token;
          client.getUserInfo(token).then((res) {
            if (res.data["code"] == 0 && res.data["msg"] == "success") {
              User _user = User.fromJson(res.data['data']);
              AppGlobal.profile.user = _user;
              EasyLoading.dismiss();
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    content: new Text('登录成功'),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        bottomNavBar(themeBloc: _themeBloc)));
                          },
                          child: new Text('好'))
                    ],
                  ));
            } else {
              EasyLoading.dismiss();
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    content: new Text(res.data['msg']),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: new Text('好'))
                    ],
                  ));
            }
          });
        } else {
          EasyLoading.dismiss();
          showDialog(
              context: context,
              child: new AlertDialog(
                content: new Text(response.data['msg']),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('好'))
                ],
              ));
        }
      });
    }else if (isEmail){
      await client.loginWithEmail(phone, password).then((response) {
        if (response.data['token'] != null) {
          String token = response.data['token'];

          prefs.setString('Token', token); // 存储到持久层。
          AppGlobal.profile.token = token;
          client.getUserInfo(token).then((res) {
            if (res.data['err'] != true) {
              EasyLoading.dismiss();
              User _user = User.fromJson(res.data['data']);
              AppGlobal.profile.user = _user;
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    content: new Text('登录成功'),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        bottomNavBar(themeBloc: _themeBloc)));
                          },
                          child: new Text('好'))
                    ],
                  ));
            } else {
              EasyLoading.dismiss();
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    content: new Text(res.data['msg']),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: new Text('好'))
                    ],
                  ));
            }
          });
        } else {
          EasyLoading.dismiss();
          showDialog(
              context: context,
              child: new AlertDialog(
                content: new Text(response.data['msg']),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('好'))
                ],
              ));
        }
      });
    }


  }

  Widget _buildTextFeild({
    String hint,
    TextEditingController controller,
    TextInputType keyboardType,
    bool obscure,
    String icon,
    TextAlign textAlign,
    Widget widgetIcon,
  }) {
    return Column(
      children: <Widget>[
        Container(
          height: 53.5,
          decoration: BoxDecoration(
            color: Colors.black26,
//              color: Color(0xFF282E41),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(
              color: colorStyle.primaryColor,
              width: 0.15,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: textAlign,
                  obscureText: obscure,
                  controller: controller,
                  keyboardType: keyboardType,
                  autocorrect: false,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: widgetIcon,
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      filled: true,
                      fillColor: Colors.transparent,
                      labelText: hint,
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void MyShowDialog(context, title) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Text(
          title,
          style: new TextStyle(fontSize: 14.0, color: Color(0xff999999)),
        ),
        // 点击按钮
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.pop(context); //  点击返回上一级
              },
              child: new Text("好"))
        ],
      ));
}

class _LoadingDialog extends Dialog {
  String text;
  Function onBack;
  _LoadingDialog({Key key, @required this.text, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer _timer;
    _timer = new Timer(new Duration(seconds: 2), () {
      onBack();
      _timer.cancel();
    });
    //  创建透明层
    return new Material(
      // 透明层类型
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
//            width : 120.0,
            height: 60.0,
            child: new Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ))),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      // top: 20.0,
                    ),
                    child: new Text(
                      text,
                      style: new TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}