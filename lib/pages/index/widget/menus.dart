import 'package:flutter/material.dart';

class MenusWidget extends StatelessWidget {
  BuildContext context;
  MenusWidget({Key key, this.context}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisSpacing: 7.5,
      mainAxisSpacing: 7.5,
      crossAxisCount: 2,
      childAspectRatio: 4,
      children: <Widget>[
        this._menusWidget("设备信息", onTap: () {
          Navigator.pushNamed(this.context, "/system/info");
        }),
        this._menusWidget("设备管理", onTap: () {
          Navigator.pushNamed(this.context, "/system/options");
        }),
        this._menusWidget("插件管理", onTap: () {
          Navigator.pushNamed(this.context, "/system/plugins");
        }),
        this._menusWidget("文件管理", onTap: () {
          Navigator.pushNamed(this.context, "/system/file", arguments: {
            "path": "/",
          });
        }),
        this._menusWidget("DHCP 租约", onTap: () {
          Navigator.pushNamed(this.context, "/system/dhcp");
        }),
      ],
    );
  }

  Widget _menusWidget(String title, {Function() onTap}) {
    return new Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
      child: new InkWell(
        child: new Center(
          child: new Container(
            child: new Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
