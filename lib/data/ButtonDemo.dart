import 'package:flutter/material.dart';

///按钮相关样式
class ButtonDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton( //漂浮按钮，默认带阴影，灰色背景，按下阴影变化
                elevation: 2.0, //正常状态下的阴影
                highlightElevation: 5.0,  //按下后的阴影
                disabledElevation: 0.0, //按钮禁用时的阴影
                child: Text("RaisedButton"),  //按钮文本
                onPressed: () => {},  //点击事件，没有的话就是禁用
              ),
              FlatButton( //扁平按钮，默认透明背景不带阴影，按下背景变化
                child: Text("FlatButton"),
                onPressed: () => {},
              ),
              OutlineButton(  //默认带有个边框的按钮，背景透明不带边框，按下边框颜色变亮，出现阴影和背景
                child: Text("OutlineButton"),
                onPressed: () => {},
              ),
              IconButton( //可点击的Icon，不包括文字，默认没有背景，点击出现背景
                icon: Icon(Icons.visibility),
                onPressed: () => {},
              ),
              FlatButton( //设置按钮外观
                color: Colors.blue, //按钮背景
                highlightColor: Colors.blue[700], //按下后背景
                colorBrightness: Brightness.dark, //按钮主题，dark为深色主题，默认浅色
                splashColor: Colors.grey, //点击后水波纹的颜色
                child: Text("Submit"),  //文本
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //外形
                onPressed: () => {},  //点击事件
              ),
            ],
          ),
        ),
      ),
    );
  }
}