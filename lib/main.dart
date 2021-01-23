import 'dart:async';
import 'dart:convert';
import 'package:crypto_template/api_client.dart';
import 'package:crypto_template/screen/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:crypto_template/screen/intro/login.dart';
import 'package:crypto_template/screen/intro/on_Boarding.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:crypto_template/screen/setting/setting.dart';
import 'package:provider/provider.dart';
import 'package:crypto_template/pmodel/profileChangeNotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';
import 'package:crypto_template/app_global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Run first apps open
void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  final Widget child;

  myApp({Key key, this.child}) : super(key: key);

  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  /// Create _themeBloc for double theme (Dark and White theme)
  ThemeBloc _themeBloc;
  int _tabIndex = 0;
  bool isLoaded = false;
  String Token;
  Map showData = {};
  PackageInfo packageInfo; //  获取当前app的信息
  ApiClient client;
  String _newVersion ; // 网络请求的版本号/名。
  String _notVersion ; // 当前app的版本号/名。
  String _upgradeNewVersion; // 处理过的版本号,使用这个
  String _upgradeNotVersion; // 处理过的版本号,使用这个
  String _installUrl ; // 下载apk的地址。
  BuildContext _context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _themeBloc = ThemeBloc();
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _getData() async {
    // Map<String, dynamic> res = null;
    var result = client.getBanben();
    result.then((value){

      _newVersion = value.data['versionShort']; // 赋值网络请求的版本号。
      _installUrl = value.data['installUrl']; // 赋值网络请请的下载apk地址。

      final data = _newVersion.split('.');
      _upgradeNewVersion = data.join('');
      // print(_notVersion + ' == ' + _upgradeNotVersion);
      // print(_newVersion + " == " + _upgradeNewVersion);
      // 判断当前网络请求的版本号是否大于当前版本号
      if( int.parse(_upgradeNotVersion) < int.parse( _upgradeNewVersion ) ){
        // 判断需要更新，则去请求更新接口，获取接口api，获取更新内容。
        // 创建 一个同步执行的 Future
        // 上面说到本来想判断更新，然后请求更新接口的，发现行不通。则更新接口需要写死在里面。getBanben()
        // 如需请求更新接口，则需改写上面的方法。
        Future.sync((){
          client.getBanbenData().then((value){
            Map<String,dynamic> res = json.decode(value.toString());
            // print(res);
            if(res['err'] != true && res['msg'] == "success"){
              setState(() {
                showData['title'] = res['title'];
                showData['data'] = res['data'].split(' ');
              });
              _show();
            }

          });
        }) ;

      }
    });
  }
  // 初始化页面后的下一个生命周期状态
  void didChangeDependencies() async {
    super.didChangeDependencies();
    client = new ApiClient();
    packageInfo = await PackageInfo.fromPlatform();
    _notVersion = packageInfo.version;  // 赋值当前的版本号
    final data = _notVersion.split('.');
    _upgradeNotVersion = data.join('');
    // print('当前版本信息 11 222 33 44 55 66 77 ');
//    await _getData();
  }


  void _show(){
    showDialog(
        context: _context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Container(
              height: 30.0,
              child: Text(showData['title'], style: TextStyle(
                  fontSize: 14
              ),
              ),
            ),
            content: Column(
              children: <Widget>[
                ...List.generate(showData['data'].length, (index){
                  return Container(
                    alignment: Alignment.topLeft,
                    // margin: EdgeInsets.fromLTRB( 0.0 , 5.0, 0.0, 5.0),
                    child: Text(showData['data'][index], textAlign: TextAlign.left,style: TextStyle(
                        height: 2
                    ),),
                  );
                })
              ],
            ),
            actions: <Widget>[
              FlatButton(child: Text('以后再说'),onPressed: (){
                Navigator.of(context).pop('no');
              },),
              Container(
                color: Colors.red,
                child: FlatButton(
                  child: Text('前往下载'),
                  onPressed: (){
                    Navigator.of(context).pop('ok');
                    //  print(_installUrl);
                    _launchURL( _installUrl );
                  },
                ),
              ),
            ],
          );
        }
    );
  }


  Future<String> _checkLogin() async {
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('Token');
    return token;
  }



  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// StreamBuilder for themeBloc
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: WalletModel()),
        ChangeNotifierProvider.value(value: PromoteModel()),
      ],
      child: StreamBuilder<ThemeData>(
        initialData: _themeBloc.initialTheme().data,
        stream: _themeBloc.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          return MaterialApp(
            title: '以比特',
            theme: snapshot.data,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(
              themeBloc: _themeBloc,
            ),
            builder: EasyLoading.init(),

            /// Move splash screen to onBoarding Layout
            /// Routes
            ///
            routes: <String, WidgetBuilder>{
              "onBoarding": (BuildContext context) =>
              new login()
            },
          );
        },
      ),
    );
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  ThemeBloc themeBloc;
  SplashScreen({this.themeBloc});
  @override
  _SplashScreenState createState() => _SplashScreenState(themeBloc);
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  ThemeBloc themeBloc;
  _SplashScreenState(this.themeBloc);
  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }

  /// To navigate layout change
  void NavigatorPage() {
    Navigator.of(context).pushReplacementNamed("onBoarding");
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/splash_screen.png'),
                fit: BoxFit.cover)),
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(0, 0, 0, 0.1),
                Color.fromRGBO(0, 0, 0, 0.1)
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
        ),
      ),
    );
  }
}
