import 'package:crypto_template/api_client_new.dart';
import 'package:crypto_template/app_global.dart';
import 'package:crypto_template/models/index.dart';
import 'package:crypto_template/pmodel/index.dart';
import 'package:crypto_template/screen/intro/change_password.dart';
import 'package:crypto_template/screen/intro/change_phone.dart';
import 'package:crypto_template/screen/setting/SeeAllTemplate.dart';
import 'package:crypto_template/screen/intro/login.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:crypto_template/screen/user/user_table_view.dart';
import 'package:crypto_template/widget/alert_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto_template/component/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class setting extends StatefulWidget {
  ///
  /// Get data bloc from
  ///
  ThemeBloc themeBloc;

  setting({Key key, this.themeBloc}) : super(key: key);

  _settingState createState() => _settingState(themeBloc);
}

class _settingState extends State<setting> {
  ///
  /// Bloc for double theme
  ///
  ThemeBloc themeBloc;
  _settingState(this.themeBloc);
  bool theme = true;
  String _img = "assets/image/setting/lightMode.png";
  String level= "未激活";
  String phone = "18900000000";

  String grade = '未激活';

  Map _userInfo = {
    'avatar': 'assets/avatars/avatar-1.jpg', // 头像
    'username': 'Nebula', // 用户名称
    'user_id': '54f84d50-a3ad-11ea-b335-618b89d4e2f9', // 用户id
  };
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                  child: Text(
                "我的",
                style: TextStyle(
                    fontFamily: "Sans",
                    fontSize: 19.5,
                    fontWeight: FontWeight.w700),
              )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  code  = AppGlobal.profile.user.inviteCode;
                  return
                    _userPanel(context,_userInfo);
                }
            )
            ,
            SizedBox(
              height: 20.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  code  = AppGlobal.profile.user.inviteCode;
                  return
                    InkWell(
                        onTap: () {
                          _Mycode(context,code);
                        },
                        child: listSetting("我的推广码", code));
                }
            )
,
            SizedBox(
              height: 10.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  level  = AppGlobal.profile.user.levelName;
                  return
                    InkWell(
                        onTap: () {
                        },
                        child: listSetting("激活状态", level));
                }
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  level  = AppGlobal.profile.user.levelName;
                  return
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new MyMembers()));
                        },
                        child: listSetting("我的团队", "查看详情"));
                }
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  level  = AppGlobal.profile.user.levelName;
                  return
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new ChangePassword()));
                        },
                        child: listSetting("修改密码", "*****"));
                }
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  phone  = AppGlobal.profile.user.mobile;
                  return
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new ChangePhone()));
                        },
                        child: listSetting("修改手机号", phone));
                }
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('Token');
                  prefs.remove('profile');
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new login(themeBloc: themeBloc)));
                },
                child: listSetting("", "退出登入")),
          ],
        ),
      ),
    );
  }

  // 用户信息
  Widget _userPanel(context,Map _userInfo,){
    String _temp;
    return Consumer<UserModel>(
        builder: (BuildContext context,UserModel value,Widget child){
          return Container(
            margin: EdgeInsets.only(left: 15,right: 15),
            height: 110,
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/logo.png'),
                  radius: 28,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Text('${value.user?.user_name}', style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 18
                            // )),
                            Text('${value.user?.nickname}', style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            )),
                            IconButton(
                              icon: Icon(Icons.edit,size: 13.0,color: Colors.white,),
                              autofocus: false,
                              onPressed: (){
                                // 修改用户名
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context)=>AlertButtonWidget(
                                    title: '请输入用户名',
                                    centerWidget: Container(
                                      margin: EdgeInsets.only(left: 30,top: 15,right: 30,bottom: 15),
                                      color: Color(0xfff8f9fd),
                                      child: TextField(
                                        onChanged: (value){
                                          // TODO 更改值
                                          _temp = value;
                                        },
                                        keyboardType: TextInputType.text,
                                        maxLines: 1,
                                        maxLength: 10,
                                        style: TextStyle(
                                            fontSize: 24,
                                            letterSpacing: 3,
                                            color: Color(0xff333333)
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '修改用户名',
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none, // 去下划线
                                        ),
                                      ),
                                    ),
                                    buttonList: [
                                      {'text': '取消','background': Color(0xbcbbcbc), 'onPressed':(){
                                        Navigator.of(context).pop();
                                      }},
                                      {'text': '确定','background': Color(0xff407fff), 'onPressed':(){
                                        // TODO 提交修改用户名
                                        ApiClient apiClient = new ApiClient();
                                        EasyLoading.show(status: '修改中，请稍后...',maskType:EasyLoadingMaskType.black );
                                        apiClient.changeName(_temp,AppGlobal.profile.token).then((res){
                                          print(res.data);
                                          if(res.data["code"] == 0 && res.data["msg"] == "success" ){
                                            EasyLoading.dismiss();
                                            //Provider.of<UserModel>(context, listen: false).changeName(res.data['data']['nickname']);
                                            showDialog(
                                                context: context,
                                                child: new AlertDialog(
                                                  content: new Text('修改成功'),
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
                                        Navigator.of(context).pop();
                                      }},
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
//                      Container(
//                        child: Row(
//                          children: <Widget>[
//                            Container(
//                                constraints: BoxConstraints(
//                                    maxWidth: MediaQuery.of(context).size.width*0.5
//                                ),
//                                child: Text('ID: ${userModel.user.user_id}', style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 14,
//                                ))
//                            ),
//                            IconButton(
//                              icon: Icon(Icons.content_copy,size: 13.0,color:  Colors.white),
//                              autofocus: false,
//                              onPressed: (){
//                                // 复制文本
//                                Clipboard.setData(ClipboardData(text: value.user?.user_id));
//                                Scaffold.of(context).showSnackBar( SnackBar(content: Text('复制ID: ${value.user?.user_id} 成功'),),);
//                              },
//                            ),
//                          ],
//                        ),
//                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  void _Mycode(context,event){
    String code = '';

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context)=>AlertButtonWidget(
        header: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('我的推广码: ',style: TextStyle(
              fontSize: 15,
              letterSpacing: 1,
              color: Color(0xff407fff),
            )),
            Consumer<UserModel>(
                builder: (BuildContext context,UserModel value,Widget child){
                  code  = AppGlobal.profile.user.inviteCode;
                  return
                    Text(code,style: TextStyle( // 邀请码
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff407fff),
                    ));
                }
            )
          ],
        ),
        centerWidget: Container(
          padding: EdgeInsets.only(left:47,right: 47,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network('https://darasakor.oss-cn-chengdu.aliyuncs.com/qrcode-ios.png',
                    fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text('将你的推广码分享给你的成员',style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Color(0xff999999)
                )),
              )
            ],
          ),
        ),
        buttonList: [
          {
            'text': '复制推广码',
            'background': Colors.red,
            'onPressed':(){
              Clipboard.setData(ClipboardData(text: code));
              //Scaffold.of(context).showSnackBar( SnackBar(content: Text('复制推广码: ${code} 成功')));
              Navigator.of(context).pop();
            }},
          {'text': '确定','background': Color(0xff407fff), 'onPressed':()=>{
            // TODO 确定
            Navigator.of(context).pop()
          }},
        ],
      ),
    );
  }

  Widget listSetting(String header, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Sans",
                fontSize: 13.0),
          ),
          SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: "Popins",
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w300),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          line()
        ],
      ),
    );
  }

  Widget line() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: double.infinity,
        height: 0.5,
        decoration: BoxDecoration(color: Theme.of(context).hintColor),
      ),
    );
  }

  ///
  /// Change to mode light theme
  ///
  DemoTheme _buildLightTheme() {
    return DemoTheme(
        'light',
        ThemeData(
          brightness: Brightness.light,
          accentColor: colorStyle.primaryColor,
          primaryColor: colorStyle.primaryColor,
          buttonColor: colorStyle.primaryColor,
          cardColor: colorStyle.cardColorLight,
          textSelectionColor: colorStyle.fontColorLight,
          scaffoldBackgroundColor: Color(0xFFFDFDFD),
          canvasColor: colorStyle.whiteBacground,
          dividerColor: colorStyle.iconColorLight,
          hintColor: colorStyle.fontSecondaryColorLight,
        ));
  }


  ///
  /// Change to mode dark theme
  ///
  DemoTheme _buildDarkTheme() {
    return DemoTheme(
        'dark',
        ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: colorStyle.background,
            backgroundColor: colorStyle.blackBackground,
            dividerColor: colorStyle.iconColorDark,
            accentColor: colorStyle.primaryColor,
            primaryColor: colorStyle.primaryColor,
            hintColor: colorStyle.fontSecondaryColorDark,
            buttonColor: colorStyle.primaryColor,
            canvasColor: colorStyle.grayBackground,
            cardColor: colorStyle.grayBackground,
            textSelectionColor: colorStyle.fontColorDark,
            textSelectionHandleColor: colorStyle.fontColorDarkTitle));
  }
}
