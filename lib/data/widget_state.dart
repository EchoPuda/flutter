import 'package:flutter/material.dart';

/// 状态管理三种方法
/// 1.Widget管理自己的状态
/// 2.父Widget管理子Widget的状态
/// 3.混合管理（父Widget和子Widget都管理状态）
class WidgetStateManager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ManageState();
}

class ManageState extends State<WidgetStateManager>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetStateManager"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '管理自己状态',
            ),
            new WidgetState(),
            Text(
              '父管理子状态'
            ),
            new ParentWidget(),
            Text(
              '混合管理'
            ),
            new ParentWidgetC(),
          ],
        ),
      ),
    );
  }
}

//--------------------子类管理自身状态----------------------------
//管理自身状态
class WidgetState extends StatefulWidget{
  WidgetState({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => new _TapboxAState();
}

class _TapboxAState extends State<WidgetState> {
  //确定当前颜色的布尔值：true为绿色，false为灰色
  bool _active = false;

  //点击时调用的函数，点击后更新_active，并用setState()更新UI
  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white,decoration: TextDecoration.none),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//--------------------父类管理子类状态----------------------------
//父类，为子类管理状态
class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    //为子类管理_active状态，当状态改变时调用setState()更新UI
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChileWidget(
          active: _active,
          onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//子类，所有状态都给父处理，所以StatelessWidget，检测到点击时通知父
class ChileWidget extends StatelessWidget{
  ChileWidget({Key key,this.active : false,@required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white,decoration: TextDecoration.none),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//--------------------混合管理----------------------------
//父类,管理_active状态
class ParentWidgetC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;

  //检测到点击时调用
  void _handleTapBoxChanged(bool newValue){
    //点击盒子后状态改变调用setState()更新UI
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildCWidget(
          active: _active,
          onChanged: _handleTapBoxChanged,
      ),
    );
  }
}

//子类，管理_highlight 状态
class ChildCWidget extends StatefulWidget{
  ChildCWidget({Key key,this.active: false,@required this.onChanged})
      :super(key : key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return new _ChildCWidgetSate();
  }
}

class _ChildCWidgetSate extends State<ChildCWidget>{
  bool _highlight = false;

  //按下时边框颜色改变，setState()更新UI，下同
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  //抬起时边框恢复
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  //按下取消时（比如按住但移出边框）边框恢复
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  //点击时，将状态的改变传递给父
  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    //GestureDetector监听所有tap事件
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white,decoration: TextDecoration.none),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[700],
          border: _highlight
            ? new Border.all(
                color: Colors.teal[700],
                width: 10.0,
              )
              : null,
        ),
      ),
    );
  }
}

