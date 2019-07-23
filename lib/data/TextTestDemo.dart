import 'package:flutter/material.dart';

///文本字体样式
class TextTestDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new TextTestState();
}

class TextTestState extends State<TextTestDemo>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetStateManager"),
      ),
      body: DefaultTextStyle( //Default默认样式
          style: TextStyle(
            color: Colors.blue, //字体颜色
            fontSize: 18.0, //字体大小
            height: 1.2,  //行高
            fontFamily: "Courier",  //字体库
            background: new Paint()..color = Colors.yellow,   //背景
            decoration: TextDecoration.none,  //下划线
            decorationStyle: TextDecorationStyle.dashed   //下划线样式
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("第一行字"),
              Text("这是第二行字"),
              Text("我不想一样"*6,
                style: TextStyle(
                  inherit: false, //不继承默认样式
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,  //对齐方式，但以自身为参照物
              ),
              Text("我更大且只能一行",
                style: TextStyle(
                  inherit: false,
                  color: Colors.black
                ),
                textScaleFactor: 1.5,   //也是改变字体的方式，不过是以倍数
                maxLines: 1,  //规定最多行数
                overflow: TextOverflow.ellipsis,  //超出文字的显示方式
              ),
              Text.rich(TextSpan(   //TextSpan可以设置文字不同部分各自样式，用Text.rich将他们添加到Text中
                style: TextStyle(
                  inherit: false,
                  color: Colors.black,
                  background: new Paint()..color = Colors.transparent
                ),
                children: [
                  TextSpan(
                    text: "绿色：",
                    style: TextStyle(
                      inherit: false,
                    )
                  ),
                  TextSpan(
                    text: "不，是黑色",
                    style: TextStyle(
                      inherit: false,
                      color: Colors.green
                    )
                  ),
                ]
              ))
            ],
          )
      )
    );
  }
}