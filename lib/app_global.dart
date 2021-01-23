import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto_template/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppGlobal {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  // 网络缓存对象

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson( jsonDecode(_profile) );
      } catch (e) {
        print(e);
      }
    }

  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
