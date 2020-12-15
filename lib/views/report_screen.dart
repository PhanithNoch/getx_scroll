import 'package:flutter/material.dart';
import 'package:getmoneyxapp/shared/components/resposive_utils/responsive_util.dart';
import 'package:getmoneyxapp/shared/components/reusable_report.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    Widget widget;
    //we able to know screen size smale or medium or large
    // by using MediaQuery
    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = reportScreenSmall();
        break;
      case ScreenSize.medium:
        widget = reportScreenMedium();
        break;
      case ScreenSize.large:
        widget = reportScreenLarge();
        break;
    }
    return widget;
  }

  Widget reportScreenSmall(){
    return Scaffold(
      appBar: appBar(),
      body: ReusableReport(),
    );
  }

  Widget reportScreenMedium(){
    return Scaffold(
      appBar: appBar(),
      body:SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ReusableReport(),
            ),
          ],
        ),
      ),
    );
  }
  Widget reportScreenLarge(){
    return Scaffold(
      appBar: appBar(),
      body:SafeArea(
        child: Row(
          children: [

            Expanded(
              flex: 4,
              child: ReusableReport(showHorizontalGridView: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar()
  {
    return AppBar(
      title: Text('Home Page'),
    );
  }

}
