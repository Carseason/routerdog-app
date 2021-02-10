import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';

// ignore: must_be_immutable
class ScanQrcodePage extends StatefulWidget {
  Map arguments;
  ScanQrcodePage({Key key, this.arguments}) : super(key: key);

  @override
  _ScanQrcodePageState createState() => _ScanQrcodePageState();
}

class _ScanQrcodePageState extends State<ScanQrcodePage> {
  QRCaptureController _captureController = QRCaptureController();
  @override
  void initState() {
    super.initState();
    // 获取到内容后
    this._captureController.onCapture((data) {
      this._captureController.pause(); //暂停
      // print('onCapture----$data');
      var value = json.decode(data);
      if (value == null) {
        this._captureController.resume(); //恢复
        return;
      }
      Navigator.pushReplacementNamed(context, '/scanview', arguments: {
        "data": value,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new QRCaptureView(controller: this._captureController),
            new Align(
              child: this._buildToolBar(),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolBar() {
    return new Container(
      margin: EdgeInsets.only(top: 40),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 32,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
