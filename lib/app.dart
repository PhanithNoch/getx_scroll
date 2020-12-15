import 'package:flutter/material.dart';
import 'package:getmoneyxapp/routes/routing.dart';
import 'package:get/get.dart';

import 'bindings/item_binding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'VarelaRound-Regular',
        ),
      ),
      initialRoute: '/',
      getPages: AppPage.routes,
    );
  }
}
