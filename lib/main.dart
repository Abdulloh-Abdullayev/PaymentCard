import 'package:flutter/material.dart';
import 'package:payment_card/core/constants/navigation_const.dart';
import 'package:payment_card/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _forRoute = Routers();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: NavigationConst.CARD_PAGE,
      onGenerateRoute: _forRoute.onGenerateRoute,
    );
  }
}
