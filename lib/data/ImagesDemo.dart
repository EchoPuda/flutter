import 'package:flutter/material.dart';

///图片相关样式
class ImagesDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ImagesDemoState();
}

class ImagesDemoState extends State<ImagesDemo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images Demo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //快捷方式
              Image.asset("images/bread.png",
                width: 20.0,
              ),
              //正常加载方式
              Image(
                image: AssetImage("images/headmaster.png"),
                width: 30.0,
              ),
              //网络加载图片
              Image(
                image: NetworkImage(
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3647447865,677810009&fm=26&gp=0.jpg"),
                width: 100.0,
              ),
              //网络加载图片快捷方式
              Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563857634076&di=3a558991c1820abaa3e3acfe73648d7b&imgtype=0&src=http%3A%2F%2Fcrawl.nosdn.127.net%2Fimg%2Fbe0a2c5b81cd7d05e6d57479535f403d.jpg",
                width: 100.0,
              ),
              //fit设置适应模式
              Image.asset("images/headmaster.png",
                width: 60.0,
                height: 30.0,
                fit: BoxFit.fill,   //拉伸填充满空间，长宽比会变化
//                fit: BoxFit.contain,  //保持长宽比居中填满显示空间，图片不会变形，超出空间剪裁
//                fit: BoxFit.cover,    //默认规则，保证图片长宽比不变情况下适应当前空间，不会变形
//                fit: BoxFit.fitWidth, //宽度缩放到空间宽度，高度按比例缩放，居中显示，超出部分剪裁
//                fit: BoxFit.fitHeight,  //高度缩放到空间高度，宽度按比例缩放，居中显示，超出部分剪裁
//                fit: BoxFit.scaleDown,  //按比例缩减
//                fit: BoxFit.none, //没有适应规则，如果图片大于空间，显示中间部分
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessibility,color: Colors.blue,),
                  Icon(Icons.error_outline,color: Colors.green,),
                  Icon(Icons.ac_unit,color: Colors.yellow,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}