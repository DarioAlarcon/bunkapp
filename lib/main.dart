import 'package:bunkapp/models/layout_model.dart';
import 'package:bunkapp/testing/testingScreen.dart';
import 'package:bunkapp/testing/new_home_page_test.dart';
import 'package:bunkapp/testing/secon_page_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp( ChangeNotifierProvider(
    create: (_)=>new LayoutModel(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunk_app',
      theme: ThemeData.dark(),
      home:  HomeTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
/*class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunk_app',
      theme: ThemeData.dark(),
      home: HomeTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/