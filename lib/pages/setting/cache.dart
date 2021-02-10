import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:routerapp/utils/index.dart' as utils;

class CacheWidget extends StatefulWidget {
  CacheWidget({Key key}) : super(key: key);

  @override
  _CacheWidgetState createState() => _CacheWidgetState();
}

class _CacheWidgetState extends State<CacheWidget> {
  String _cacheSizeStr;
  @override
  // ignore: must_call_super
  void initState() {
    this.loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      decoration: new BoxDecoration(
        color: Color(0XFFffffff),
      ),
      child: new InkWell(
        child: new Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: new Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0XFFeeeeee))),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, // 次轴元素的排序方式
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Row(
                  children: [
                    new Container(
                      child: new Text(
                        "缓存管理",
                        style: new TextStyle(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 200,
                      alignment: Alignment.centerRight,
                      child: new Text(
                        this._cacheSizeStr ?? "计算中",
                        maxLines: 2,
                        style: new TextStyle(
                          color: Color(0XFF666666),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    new Icon(
                      Icons.chevron_right,
                      color: Color(0XFF999999),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          String _cacheSize = this._cacheSizeStr ?? '计算中';
          utils.showDialog(
            context: context,
            title: "缓存管理",
            content: "确认要清理 $_cacheSize 本地缓存吗?",
            success: () {
              this._clearCache();
            },
          );
        },
      ),
    );
  }

  ///加载缓存
  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      setState(() {
        _cacheSizeStr = _renderSize(value); // _cacheSizeStr用来存储大小的值
      });
    } catch (err) {
      print(err);
    }
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  //清空缓存
  void _clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache();
    setState(() {
      this._cacheSizeStr = "0B";
    });
    utils.ShowToast("已清理所有缓存");
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }
}
