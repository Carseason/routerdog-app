import 'package:flutter/material.dart';
import 'package:routerapp/widgets/index.dart' as widgets;

class CPUWidget extends StatelessWidget {
  final double used;
  final String name;
  const CPUWidget(this.used, this.name, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new widgets.GaugeChart(
            seriesList: widgets.GaugeChart.createSampleData(
              this.used,
            ),
            arcWidth: 10,
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '${this.used}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                new Text(
                  '${this.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
