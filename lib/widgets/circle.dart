import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleTop extends StatelessWidget {
  final String title;
  final String number;
  CircleTop({this.number, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 13.0,
        animation: true,
        //TODO if number is bigger then 200 it will crash
        percent: title == 'CGPA'
            ? .25 * double.parse(number)
            : .005 * double.parse(number),
        center: new Text(
          number,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        footer: new Text(
          title,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.blue,
      ),
      // CircleAvatar(
      //   radius: 50,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[Text(number), Text(title)],
      //   ),
      // ),
    );
  }
}
