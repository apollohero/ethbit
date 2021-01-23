import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';


class ApiClient {
  //static const String baseUrl = 'http://192.168.0.108:3001/';
  //static const String baseUrl = 'http://server.darasakor.vip:3000/';
  static const String baseUrl = 'http://47.91.228.105:8060/darasakor-api';
//  static const String baseUrl = 'http://192.168.0.107:3001/';
  var dio = ApiClient.createDio();

  //登陆login
  Future<dynamic> login() async {
    String phone;
    String passwd;
    String email;

    Response<Map> response = await dio.post('/api/users/login',data: {
      email,
      phone,
      passwd
    });
    return response.toString();
  }

  //获得用户信息
  Future<dynamic> getMarketInfo(String token) async {
    try {
      return await dio.get('/market/base',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得用户信息
  Future<dynamic> getTeamMember(String token) async {
    try {
      return await dio.get('/market/base',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }


  Future<dynamic> getPrice(String token) async {
    try {
      return await dio.get('/spaceOrder/price',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }



  Future<dynamic> getConfig() async {
    try {
      return await dio.get('/explain/list');
    } on DioError catch(e){
      //print(e);
    }
  }


  // 获取市场账户信息
  Future<dynamic> getMarketAccount(String token) async{
    try {
      return await dio.get('/market/account',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
//      print(e);
    }
  }
  // 提交市场账户转账信息
  Future<dynamic> postMarketTransfer(String token,Map data) async{
    try {
      return await dio.post('/market/transfer',options: Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ),data: data);
    } on DioError catch(e){
      //print(e);
    }
  }
  // 获取市场账户奖励明细
  Future<dynamic> getMarketRewardOrder(String token,String type) async{
    try {
      return await dio.get('market/rewardOrder/list',queryParameters: {
        'market_reward_type': type,
      },options: Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }


  // 获取点击时候套餐的费用价格
  Future<dynamic> getProduct(String token) async {
    try {
      return await dio.get('/spaceOrder/product',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得用户信息
  Future<dynamic> getUserInfo(String token) async {
    try {
      dio.options.headers["token"] = token;
      dio.options.headers["versionCode"] = 100;
      dio.options.headers["appType"] = 1;
      return await dio.post('/api/users/getUserInfo');
    } on DioError catch(e){
      print(e);
    }
  }

  // 获取今日收益和释放锁仓收益
  Future<dynamic> getReleaseProfit(String token, String type) async {
    String _Url = '/profit/totay_release?type=$type';
    print(_Url);
    try {
      return await dio.get( _Url ,options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  // 获取钱包最低限额和手续费
  Future<dynamic> getWithdrawInfo(String token) async {
    try {
      return await dio.get('/withdraw/info',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得用户信息
  Future<dynamic> getArticles() async {
    Response response;
    try {
      return await dio.get('/article/list');
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得用户信息
  Future<dynamic> getWithdrawList(String token,String type) async {
    try {
      return await dio.get('/withdraw/list',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ),
          queryParameters: {
            "withdraw_type":type,
            "currentPage":1,
            "pageSize":100
          }
      );
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得奖励明细
  Future<dynamic> getGainInfo(String token) async {
    try {
      return await dio.get('/promotion/rewardList',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得奖励明细
  Future<dynamic> getMyMembers(String token) async {
    try {
      dio.options.headers["token"] = token;
      dio.options.headers["versionCode"] = 100;
      dio.options.headers["appType"] = 1;
      return await dio.get('/api/users/team');
    } on DioError catch(e){
      print(e);
    }
  }


  //获得奖励明细
  Future<dynamic> getTotalMembers(String token,String path) async {
    try {
      return await dio.post('/users/path_number',
          options:Options(
              headers: {
                HttpHeaders.authorizationHeader:token
              }),
          data: {
            "path":path,
          }
      );
    } on DioError catch(e){
      //print(e);
    }
  }


  //获得奖励明细
  Future<dynamic> getTeamPeople(String token) async {
    try {
      return await dio.get('/market/teamsPeople/list',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得置换订单记录
  Future<dynamic> getPurchaseOrders(String token) async {
    try {
      return await dio.get('spaceOrder/myOrder',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }

  //获得置换订单记录
  Future<dynamic> getDepositOrders(String token) async {
    try {
      return await dio.get('promotion/usdtOrder',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }



  //获得推广列表
  Future<dynamic> getPromotionList(String token) async {
    try {
      return await dio.get('/promotion/count',options:Options(
          headers: {
            HttpHeaders.authorizationHeader:token
          }
      ));
    } on DioError catch(e){
      //print(e);
    }
  }




  //登陆login
  Future<dynamic> loginWithPhone(String phoneNum,String passWd) async {
    String phone = phoneNum;
    String passwd = passWd;
    Response response;
    try {
      return await dio.post('/api/users/login',data: {
        "phone":phone,
        "passwd":passwd,
      });

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //登陆login
  Future<dynamic> loginWithEmail(String email,String passWd) async {
    String Email = email;
    String passwd = passWd;
    Response response;
    try {
      return await dio.post('/api/users/login',data: {
        "email":Email,
        "passwd":passwd,
      });

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //直传
  Future<dynamic> geStsToken(String token) async {
    try {
      return await dio.get('/usdtOrder/usdt_upload',
          options:Options(
              headers: {
                HttpHeaders.authorizationHeader:token
              })
      );
    } on DioError catch(e){
      //print(e);
    }
  }

  //发送
  Future<dynamic> sendSms(String phoneNum,String codeType) async {
    String phone = phoneNum;
    Response response;
    try {
      return await dio.post('/sms/send',data: {
        "phonenum":phone,
        "codeType":codeType
      });

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //
  Future<dynamic> sendEmail(String email,String codeType) async {
    String phone = email;
    Response response;
    try {
      return await dio.post('darasakor-api/sms/send/email',data: {
        "email":email,
        "codeType":codeType
      });

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //登陆login
  Future<dynamic> verifySms(String phoneNum,String code) async {
    String phone = phoneNum;
    Response response;
    try {
      return await dio.post('sms/compare',data: {
        "phonenum":phone,
        "code":code,

      }
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //登陆login
  Future<dynamic> purchaseSpace(int spaceNum,num spacePrice,String token, String _id) async {
    Response response;
    try {
      return await dio.post('spaceOrder',data: {
        "spaceNum":spaceNum,
        "spacePrice":spacePrice,
        "product_id" : _id
      },
          options:Options(
              headers: {
                HttpHeaders.authorizationHeader:token
              })
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //登陆login
  Future<dynamic> depositApply(num usdtNum,String address,String imageUrl,String token) async {
    Response response;
    try {
      return await dio.post('usdtOrder',data: {
        "usdt_order_num":usdtNum,
        "usdt_confirm_address":address,
        "usdt_order_image":imageUrl
      },
          options:Options(
              headers: {
                HttpHeaders.authorizationHeader:token
              })
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //登陆login
  Future<dynamic> withdrawApply(String type,num num,String address,String Token) async {
    try {
      return await dio.post('withdraw',data: {
        "withdraw_type":type,
        "withdraw_num":num,
        "withdraw_address": address
      },
          options:Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              })
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
        return e.response;
      }
    }
  }


  //登陆login
  Future<dynamic> resetPassword(String phoneNum,String code,String password,String type,String token) async {
    Response response;
    try {
      dio.options.headers["token"] = token;
      dio.options.headers["versionCode"] = 100;
      dio.options.headers["appType"] = 1;
      return await dio.post('/api/users/updatePwd',data: {
        "pwd":password,
        "code":code,
        "type":type
      },
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  Future<dynamic> changePhone(String oldPhone,String newPhone,String code,String Token) async {
    Response response;
    try {
      dio.options.headers["token"] = Token;
      dio.options.headers["versionCode"] = 100;
      dio.options.headers["appType"] = 1;
      return await dio.post('/api/users/updateMobile',data: {
        "oldMobile":oldPhone,
        "mobile":newPhone,
        "code":code,
      },
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  Future<dynamic> changeName(String name,String Token) async {
    Response response;
    try {
      dio.options.headers["token"] = Token;
      dio.options.headers["versionCode"] = 100;
      dio.options.headers["appType"] = 1;
      return await dio.post('/api/users/updateUserInfo',data: {
        "content":name,
        "type":2
      }
      );

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }
  }

  //手机号注册
  Future<dynamic> register(String phone_num,String user_name,String passwd,String parent_code,String code) async {
    Response response;
    try {
      return await dio.post('/api/users/register',data: {
        'phone_num':phone_num,
        'user_name':user_name,
        'passwd':passwd,
        'parent_code':parent_code,
        'code':code
      });

    } catch(e){

      return await e.response;


    }
  }
  //邮箱注册
  Future<dynamic> mail_register(String mail_address,String user_name,String passwd,String parent_code,String code) async {
    Response response;
    try {
      return await dio.post('/api/users/register',data: {
        'phone_num':mail_address,
        'user_name':user_name,
        'passwd':passwd,
        'parent_code':parent_code,
//        'location_provice':location_provice,
//        'location_city':location_city,
//        'location_area':location_area,
        'code':code
      });

    } catch(e){

      return await e.response;


    }
  }

  //提交入金订单
  Future<dynamic> withdraw() async {
    String phone_num;
    String passwd;
    String parent_cpde;
    String location_provice;
    String location_city;
    Response<Map> response = await dio.post('users/register/phone',data: {
      phone_num,
      passwd,
      parent_cpde,
      location_provice,
      location_city
    }
    );

    return response.toString();
  }



  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: Headers.formUrlEncodedContentType,
      queryParameters: {

      },
    );
    return Dio(options);
  }


  //  市场基本信息。
  Future getMarket(String Token) async{
    // const httpHeaders = {
    //   "Authorization" : Token
    try{
      Dio dio = Dio();
      // dio.options.headers = httpHeaders;
      return await dio.get(baseUrl + "market/base",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  // 直属会员
  Future getTeamsPeople(String Token) async{
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "market/teamsPeople/list",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }



  // 直属营业部
  Future getDepartment(String Token) async{
    // const httpHeaders = {
    //   "Authorization" : Token
    // };
    try{
      Dio dio = Dio();
      // dio.options.headers = httpHeaders;
      return await dio.get(baseUrl + "market/department/list",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  Future<dynamic> uploadImage(File file) async{
    String path = file.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:name)
    });
    Response response;
    try {
      return await dio.post('usdtOrder/usdt_upload',data: formdata);

    } on DioError catch(e){
      if (e.response != null) {
        print(e.response);
        return e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return response;

    }

  }

  // 委托购买记录中的独立集群colony
  Future getColony(String Token) async{
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "spaceOrder/myClusterOrder",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  // 转账明细
  Future getTransfer(String Token) async{
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "market/transfer/list",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  // 推广明细
  Future getDirect(String Token, ) async{
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "profit/moon_people",
          options: Options(
              headers: {
                HttpHeaders.authorizationHeader:Token
              }
          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }


  // 空间收益明细
  /**
   * token
   * type 类型
   * currentPage页数
   * _pageSize 条数
   * starttime 开始时间
   * endTimer 结束时间
   */
  Future getProfitDetail(String Token, String _type, num _currentPage , num _pageSize , String _startTime , String _endTime ) async{
    String _url = "?type=$_type&currentPage=$_currentPage&pageSize=$_pageSize&startTime=$_startTime&endTime=$_endTime";
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "profit/list" + _url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:Token
            },

          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  // 市场今日收益
  Future getMarketToday(String Token, String _type, String _id) async{
    String _url = "?type=$_type&market_id=$_id";
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "profit/market/totay_release" + _url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:Token
            },

          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  //
  // 市场收益明细
  /**
   * token
   * type 类型
   * currentPage页数
   * _pageSize 条数
   * starttime 开始时间
   * endTimer 结束时间
   */
  Future getMarketDetail(String Token, String _type, num _currentPage , num _pageSize , String _startTime , String _endTime, String _id ) async{
    String _url = "?type=$_type&market_id=$_id&currentPage=$_currentPage&pageSize=$_pageSize&startTime=$_startTime&endTime=$_endTime";
    try{
      Dio dio = Dio();
      return await dio.get(baseUrl + "profit/market/list" + _url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:Token
            },

          )
      );
    } catch(e) {
      print(e);
      return e.response;
    }
  }
  // 版本更新
  Future getBanben() async{
    try{

      Dio dio = Dio();
      return await dio.get("http://api.bq04.com/apps/latest/modolab.nebula_app?api_token=b7a4770f76e8219bd9e635192bf180b5");
    } catch(e) {
      print(e);
      return e.response;
    }
  }

  // 更新版本的数据
  Future getBanbenData() async{
    try{
      Dio dio = Dio();
      return await dio.get( baseUrl + 'users/version');
    } catch(e) {
      print(e);
      return e.response;
    }
  }




// 修改密码
//  Future resetPassword(String phone, String code , String password) async {
//    try{
//      return await dio.put(baseUrl + "users/reset/password", data: {
//        "phone" : phone,
//        "code" : code,
//        "password" : password,
//        "type" : "0"
//      });
//    }catch(e){
//      return e.response;
//    }
//  }
//
//  // 修改手机号
//  Future changePhone(String oldPhone, String newPhone, String code, String Token) async {
//    try{
//      return await dio.put(baseUrl + "users/phone", data: {
//        "oldPhone" : oldPhone,
//        "code" : code,
//        "newPhone" : newPhone,
//      }, options:Options(
//          headers: {
//            HttpHeaders.authorizationHeader:Token
//          }));
//    }catch(e){
//      return e.response;
//    }
//  }


}