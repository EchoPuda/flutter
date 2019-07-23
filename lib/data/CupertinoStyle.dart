//cupertino.dart ： IOS风格的包
import 'package:flutter/cupertino.dart';

///IOS风格的界面展示
class CupertinoStyle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: (){}
        ),
      ),
    );
  }

}