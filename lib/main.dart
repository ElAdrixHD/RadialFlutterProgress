import 'package:flutter/material.dart';
import 'package:progress_bar/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterProgress',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      onGenerateRoute: (settings){
        switch(settings.name){
          case HomePage.route:
            return MaterialPageRoute(builder: (_) => HomePage());
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}