// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//更新的基类 ,所有需要状态管理的都需要继承该基类
class StoreWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  StoreWidget({Key key, this.model, this.child, this.builder})
      : super(key: key);

  @override
  _StoreWidgetState<T> createState() => _StoreWidgetState<T>();
}

class _StoreWidgetState<T extends ChangeNotifier>
    extends State<StoreWidget<T>> {
  @override
  Widget build(BuildContext context) {
    //复用对象
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      //  create: (_) => widget.model,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
    //唯一对象
    // return ChangeNotifierProvider<T>(
    //   create: (_) => widget.model,
    //   child: Consumer<T>(
    //     child: widget.child,
    //     builder: widget.builder,
    //   ),
    // );
  }
}

//全局的状态对象
class MyChangeNotifier extends ChangeNotifier {
  int _counter = 0;
  int get counter {
    return this._counter;
  }

  update() {
    this._counter++;
    print(this._counter);
    this.notifyListeners(); //要更新UI记得调用这个方法
  }
}

//实现例子
class TestStore extends StatelessWidget {
  TestStore({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreWidget<MyChangeNotifier>(
      model: new MyChangeNotifier(),
      builder: (context, value, child) {
        return Column(
          children: <Widget>[
            Text(
              '计数:${value.counter}',
            ),
            FloatingActionButton(
              onPressed: () {
                value.update();
              },
              child: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
