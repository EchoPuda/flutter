import 'package:flutter/material.dart';

class SwitchAndCheckBoxDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new SwitchAndCheckBoxState();
}

class SwitchAndCheckBoxState extends State<SwitchAndCheckBoxDemo>{
  bool _switchSelected = true;  //维护单选开关状态
  bool _checkBoxSelected = true;  //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch And CheckBox"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchSelected,   //当前状态
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.red,  //选中时的颜色
              onChanged: (value){
                setState(() {
                  _checkBoxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

}