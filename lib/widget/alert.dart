import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// 弹窗组件
// AlertWidget(context,标题(header)，标题样式，中间组件，底部组件)
AlertWidget({
  BuildContext context, // 内容
  String title, // 标题
  Widget header=null, // 自定义头部
  Widget centerWidget, // 中间组件
  Widget bottomWidget, // 底部组件
  TextStyle titleStyle=const TextStyle( // 标题样式
    fontSize: 18,
    letterSpacing: 2,
    fontWeight: FontWeight.w600,
    color: Color(0xff3a7dfa),
  ),
}){
  return Dialog(
    shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(5))
    ),
    child: Container(
      padding: EdgeInsets.all(0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8, // 设置最大宽度
        maxHeight: MediaQuery.of(context).size.height * 0.7, // 设置最大高度
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15,bottom: 12),
            alignment: Alignment.center,
            child: header!=null?header:Text(title,style: titleStyle),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8, // 设置最大宽度
              maxHeight: MediaQuery.of(context).size.height * 0.3, // 设置最大高度
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: centerWidget,
            ),
          ),
          bottomWidget,
        ],
      ),
    ),
  );
}
