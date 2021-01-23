import 'package:flutter/material.dart';

// 通用表格组建

/**  啥数据都可以省略， 唯独Data数据不能省略。
 *   数据格式Data = {"TitleData" : ["标题" , "标题"], "DataList" : [{"数据", "数据"},{"数据", "数据"}] }
 *   this.TitleBackgroundColor , // 头部背景色
 *   this.TitleHeight , // 头部的头部的高度
 *   this.TitleFontSize, // 头字体大小
 *   this.TitleColor , // 字体颜色
 *   this.Width, // 总体宽度
 *   this.ChlidHeight, // 列表的高度。
 *   this.ChildBackgroundColor, // 列表的背景色
 *   this.ChildFontSize,  // 列的字体大小
 *   this.ChildColor, // 列表字体颜色
 *   this.Data, // 数据。
 */
class TemplateViewList extends StatelessWidget{
  TemplateViewList({
    this.TitleBackgroundColor , // 头部背景色
    this.TitleHeight , // 头部的头部的高度
    this.TitleFontSize, // 头字体大小
    this.TitleColor , // 字体颜色
    this.Width, // 总体宽度
    this.ChlidHeight, // 列表的高度。
    this.ChildBackgroundColor, // 列表的背景色
    this.ChildFontSize,  // 列的字体大小
    this.ChildColor, // 列表字体颜色
    this.Data, // 数据。
  });

  var TitleBackgroundColor ;
  var  TitleHeight;
  var  TitleFontSize;
  var  TitleColor;
  var  Width;
  var  ChlidHeight;
  var  ChildBackgroundColor;
  var  ChildFontSize;
  var  ChildColor;
  var Data;

  // 渲染数据格式
  // Map mydata = {
  //   "TitleData" : ["提现数量" , "提现日期" , "审核状态", "备注"],
  //   "DataList" : [
  //     {"10" , "2020-5-8 11:12:10", "通过" , "测试"},
  //     {"120" , "2020-5-7 11:12:10", "未通过" , "测试"}
  //   ]
  // };

  // Map mydata = {
  //   "TitleData" : ["会员ID" , "会员用户名" , "创建时间"],
  //   "DataList" : [
  //     {"2042556" , "defdefde", "2020-5-8" },
  //     {"2042556" , "defdefde", "2020-5-8" },
  //     {"2042556" , "defdefde", "2020-5-8" },
  //     {"2042556" , "defdefde", "2020-5-8" },
  //   ]
  // };


  @override
  Widget build(BuildContext context){
    // 获取屏幕大小
    final screen = MediaQuery.of(context);
    final my_width = screen.size.width / 100;
    final my_height = screen.size.height / 100;

    TitleBackgroundColor = TitleBackgroundColor == null ?  0xff3A7DFA : TitleBackgroundColor;
    TitleHeight = TitleHeight == null ? 42.0 : TitleHeight;
    TitleFontSize = TitleFontSize == null ? 14.0 : TitleFontSize;
    TitleColor = TitleColor == null ? 0xffFFFFFF : TitleColor;
    Width = Width == null ? my_width * 90 : Width ;
    ChlidHeight = ChlidHeight == null ? 46.0 : ChlidHeight;
    ChildBackgroundColor = ChildBackgroundColor == null ?  '0xffFFFFFF' : ChildBackgroundColor;
    ChildFontSize = ChildFontSize == null ? 13.0 : ChildFontSize;
    ChildColor = ChildColor == null ? 0xff333333 : ChildColor;
    Data = Data == null ? {} : Data;

    // 头部导航
    List<Widget> TitleList = [];
    List<Widget> DataList = [];
    // item 名 ， data 数据
    Data.forEach((name, data){
      if(name == 'TitleData'){
        for(var item in data){
          TitleList.add(
            new Expanded(
              // child: new Text(item, style: new TextStyle( fontSize : TitleFontSize , color: Color(TitleColor)),)
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize : TitleFontSize,
                    color: Color(TitleColor),
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        }
      }
      else if(name == 'DataList'){
        for (var items in data) {
          List<Widget> childNode = [];
          for (var item in items) {
            childNode.add(
                new Expanded(

                  child: Text(
                      item,
                      softWrap : false,
                      overflow : TextOverflow.visible ,
                      textAlign: TextAlign.center,
                      style : new TextStyle(
                        fontSize : ChildFontSize,
                        color: Color(ChildColor),
                      )
                  ),
                )
            );
          }
          DataList.add(
              new Container(
                  height: ChlidHeight,
                  decoration: BoxDecoration(
                      border : Border(
                          bottom : BorderSide(
                              width: 0.5,
                              color: Color(0xfff2f2f2)
                          )
                      )
                  ),
                  child : new Row(
                      children : childNode
                  )
              )
          );
          childNode = [];
        }
      }
    });


    // print(TitleFontSize);
    return Container(
        width: Width,
        margin: EdgeInsets.only(top : my_width * 2.5, left : my_width * 5, right:  my_width * 5 , bottom:  my_width * 5),
        // height: 200.0,
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0)
        ),
        child: Column(
          children: <Widget>[
            new Container(
                height: TitleHeight,
                // color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.red,
                    // color: Colors.red,
                    borderRadius: BorderRadius.only( topLeft: Radius.circular(7.0) , topRight: Radius.circular(7.0) )
                ),
                child : new Row(
                    children : TitleList
                )
            ),
            new Container(
                child : new Column(
                    children : DataList
                )
            )
          ],
        )
    );
  }

}