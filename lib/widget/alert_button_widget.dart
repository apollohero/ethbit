import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 依赖
import 'package:crypto_template/widget/alert.dart';
// 弹出文本组件 依赖 alert 组件
class AlertButtonWidget extends StatefulWidget {
  final String title; // 弹窗标题
  final Widget header; // 头部容器
  final Widget centerWidget; // 中间容器
  final List<Map> buttonList; // 按钮列表
  // 构造函数
  AlertButtonWidget({
    Key key,
    this.title,
    this.header=null,
    this.centerWidget,
    this.buttonList,
  })
      :super(key: key);
  @override
  State<StatefulWidget> createState()=> _AlertButtonWidgetState();
}

class _AlertButtonWidgetState extends State<AlertButtonWidget> with SingleTickerProviderStateMixin {

  // 输出button
  Row _getButton(List<Map> list){
    List<Expanded> _temp = [];
    list.forEach((item) {
      _temp.add(Expanded(
        flex: 1,
        child: RaisedButton(
          padding: EdgeInsets.only(top: 12,bottom: 12),
          color: item['background'],
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(0))
          ),
          child: Text(item['text'],style: TextStyle(
            fontSize: 15,
            letterSpacing: 2,
            color: Colors.white,
          )),
          onPressed: item['onPressed'],
        ),
      ));
    });
    return Row(
      children: _temp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertWidget(
        header: widget.header,
        context: context,
        title: widget.title,
        centerWidget: widget.centerWidget,
        bottomWidget: Container(
          height: 44,
          child: _getButton(widget.buttonList),
        )
    );
  }
}

