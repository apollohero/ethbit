import 'package:crypto_template/models/index.dart';
import 'package:crypto_template/screen/Application/application.dart';
import 'package:crypto_template/screen/Bottom_Nav_Bar/custom_nav_bar.dart';
import 'package:crypto_template/screen/home/home.dart';
import 'package:crypto_template/screen/market/markets.dart';
import 'package:crypto_template/screen/news/news_home.dart';
import 'package:crypto_template/screen/setting/setting.dart';
import 'package:crypto_template/screen/setting/themes.dart';
import 'package:crypto_template/screen/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:crypto_template/component/style.dart';
import 'package:crypto_template/api_client_new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_template/app_global.dart';
import 'package:crypto_template/screen/intro/login.dart';


class bottomNavBar extends StatefulWidget {

  ///
  /// Function themeBloc for get data theme from main.dart for double theme dark and white theme
  ///
  ThemeBloc themeBloc;
  bottomNavBar({this.themeBloc});

  _bottomNavBarState createState() => _bottomNavBarState(themeBloc);
}

class _bottomNavBarState extends State<bottomNavBar> {
 ThemeBloc _themeBloc;
 _bottomNavBarState(this._themeBloc);
  int currentIndex = 0;
  bool _color =true;
  Widget callPage(int current){
    switch (current) {
       case 0:
        return new home();
        break;
      case 1:
      return new wallet();
        break;
      case 2:
      return new application();
        break;
        case 3:
      return new news();
        break;
      case 4:
     return new setting(themeBloc :_themeBloc);
        break;
      default: 
      return new home();
    }
  }
  void checkAuth() async{
    SharedPreferences prefs = await SharedPreferences.getInstance(); // 持久数据创建
    ApiClient client = new ApiClient();

    client.getUserInfo(AppGlobal.profile.token).then((res) {

      if (res.data["code"] == 0 && res.data["msg"] == "success") {
        print(res.data);
        User _user = User.fromJson(res.data['data']);
        AppGlobal.profile.user = _user;
      } else {
        showDialog(
            context: context,
            child: new AlertDialog(
              content: new Text(res.data['msg']),
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
      }
    });
  }

 
   @override
  Widget build(BuildContext context) {

    
    return Scaffold(
       body: callPage(currentIndex),


        bottomNavigationBar: BottomNavigationDotBar ( // Usar -> "BottomNavigationDotBar"
        color: Theme.of(context).hintColor,
      items: <BottomNavigationDotBarItem>[
        BottomNavigationDotBarItem(icon: Icons.home, onTap: () { setState(() {
          checkAuth();
         currentIndex = 0;
        }); }),
        BottomNavigationDotBarItem(icon: Icons.account_balance_wallet, onTap: () { setState(() {
          checkAuth();
         currentIndex = 1;
        }); }),
         BottomNavigationDotBarItem(icon: Icons.shopping_bag, onTap: () { setState(() {
           checkAuth();
         currentIndex = 2;
        }); }),  
         BottomNavigationDotBarItem(icon: Icons.library_books, onTap: () { setState(() {
           checkAuth();
        currentIndex = 3;
        }); }),
         BottomNavigationDotBarItem(icon: Icons.settings, onTap: () { setState(() {
           checkAuth();
         currentIndex = 4;
        }); }), 
         ]
  ),

    );
  }
}