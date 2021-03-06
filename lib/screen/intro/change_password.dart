import 'dart:async';

import 'package:crypto_template/api_client_new.dart';
import 'package:crypto_template/app_global.dart';
import 'package:crypto_template/component/style.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_template/screen/intro/login.dart';
import 'package:crypto_template/screen/setting/themes.dart';

// 更改手机号页面
class ChangePassword extends StatefulWidget {
  ThemeBloc themeBloc;
  ChangePassword({this.themeBloc});
  @override
  _ChangePasswordState createState() => _ChangePasswordState(themeBloc);
}

class _ChangePasswordState extends State<ChangePassword> {
  ThemeBloc _themeBloc;
  _ChangePasswordState(this._themeBloc);
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool isSend = false;
  var _timer;
  var _count = 60;
  String phone_num = " ",
      password = " ",
      confirm_password = " ",
      code = " "; // 验证码

  // 计时器
  void SetInterval() {
    if (isSend) {
      _timer = new Timer(new Duration(seconds: 1), () {
        _timer.cancel();
        if (_count < 1) {
          isSend = false;
          _timer.cancel();
        }
        setState(() {
          --_count;
        });
      });
    } else {
      return;
    }
  }


  // 修改手机号
  _changePasswd(context) async {
//    setState(() => _enabled = false);
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    RegExp email = new RegExp(
        r"^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
    var isPhone = mobile.hasMatch(phone_num);
    var isEmail = email.hasMatch(phone_num);
    // TODO 提交修改手机号逻辑
    ApiClient apiClient = new ApiClient();
    if (isPhone == true) {
      EasyLoading.show(status: '修改中，请稍后...',maskType:EasyLoadingMaskType.black );
      apiClient.resetPassword(
          phone_num,code,confirm_password,"1",AppGlobal.profile.token).then((res) {
        if (res.data['msg'] == 'success') {
          EasyLoading.dismiss();
          showDialog(
              context: context,
              child: new AlertDialog(
                content: new Text('修改密码成功'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('Token');
                        prefs.remove('profile');
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => new login(themeBloc: _themeBloc)));

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
    }else if (isEmail == true) {
      EasyLoading.show(status: '修改中，请稍后...',maskType:EasyLoadingMaskType.black );
      apiClient.resetPassword(
          phone_num,code,confirm_password,"1",AppGlobal.profile.token).then((res) {
        if (res.data['msg'] == 'success') {
          EasyLoading.dismiss();
          showDialog(
              context: context,
              child: new AlertDialog(
                content: new Text('修改密码成功'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
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
    }else {
      EasyLoading.dismiss();
      showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text("手机/邮箱不正确！"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {},
                  child: new Text('好'))
            ],
          ));
    }
  }


  Widget build(BuildContext context) {
    SetInterval();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "修改密码",
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
        backgroundColor: Colors.black,
      ),
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
                    /// Animation text marketplace to choose Login with Hero Animation (Click to open code)
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
                                data: ThemeData(hintColor: Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return '请输入手机号/邮箱';
                                      }
                                    },
                                    onChanged: (input) {
                                      setState(() {
                                        phone_num = input;
                                      });
                                    },
                                    style: new TextStyle(color: Colors.white),
                                    textAlign: TextAlign.start,
                                    controller: _phoneController,
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
                                data: ThemeData(hintColor: Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return '请输入密码';
                                      }
                                    },
                                    onChanged: (input) {
                                      setState(() {
                                        password = input;
                                      });
                                    },
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
                                data: ThemeData(hintColor: Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return '请再次输入密码';
                                      }
                                    },
                                    onChanged: (input) {
                                      setState(() {
                                        confirm_password = input;
                                      });
                                    },
                                    style: new TextStyle(color: Colors.white),
                                    textAlign: TextAlign.start,
                                    controller: _confirmController,
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
                                        labelText: '确认密码',
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
                          left: 20.0, right: 20.0, top: 40.0),
                      child: Container(
                        height: 53.5,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: colorStyle.primaryColor,
                            width: 0.15,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 10.0),
                          child: Theme(
                            data: ThemeData(hintColor: Colors.transparent),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return '请输入验证码';
                                        }
                                      },
                                      onChanged: (input) {
                                        setState(() {
                                          code = input;
                                        });
                                      },
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      controller: _codeController,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(
                                              Icons.adjust,
                                              color: colorStyle.primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: '验证码',
                                          hintStyle:
                                          TextStyle(color: Colors.white),
                                          labelStyle: TextStyle(
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    child: Row(children: <Widget>[
                                      isSend
                                          ? Container(
                                        constraints: BoxConstraints(
                                          minWidth: 60,
                                        ),
                                        height: 32,
                                        padding: EdgeInsets.only(
                                            top: 0, left: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          "$_count\s 后重新发送！",
                                          style: new TextStyle(
                                              fontSize: 14,
                                              color: Colors.red),
                                        ),
                                      )
                                          : Container(
                                        constraints: BoxConstraints(
                                          minWidth: 60,
                                        ),
                                        height: 32,
                                        color: Colors.transparent,
                                        child: FlatButton(
                                          onPressed: () {
                                            SetInterval();
                                            setState(() {
                                              _count = 60;
                                              isSend = true;
                                            });
                                            // 发送验证码 Api调用
                                            Send(context, phone_num);
                                          },
                                          child: Text(
                                            "发送验证码",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          _changePasswd(context);
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
                              "重置密码",
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
    );
  }

  // 发送验证码
  // 发送验证码
  Send(context, phone) {
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    RegExp email = new RegExp(
        r"^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
    var isPhone = mobile.hasMatch(phone);
    var isEmail = email.hasMatch(phone);
    if (isPhone == true) {
      ApiClient apiClient = ApiClient();
      print(phone);
      apiClient
          .sendSms(phone, '3')
          .then((value) => {print(value), print("发送验证码")});
    } else if (isEmail == true){
      ApiClient apiClient = ApiClient();
      apiClient
          .sendEmail(phone, '3')
          .then((value) => {print(value), print("发送验证码")});
    } else
    {
      showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text('手机/邮箱有误！'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text('好'))
            ],
          ));
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
                child: TextField(
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

