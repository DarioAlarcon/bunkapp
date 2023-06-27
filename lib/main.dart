import 'package:bunkapp/models/layout_model.dart';
import 'package:bunkapp/pags/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp( ChangeNotifierProvider(
    create: (_)=>LayoutModel(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunk_app',
      theme: ThemeData.dark(),
      home:  mainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}