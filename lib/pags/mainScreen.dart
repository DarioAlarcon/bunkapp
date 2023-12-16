import 'package:bunkapp/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../widgets/animated_navigation_bar.dart';

// ignore: camel_case_types
class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final layoutMOdel = Provider.of<LayoutModel>(context);
    return MediaQuery.of(context).size.width<=500?Scaffold(
      body: layoutMOdel.currentPage,
      bottomNavigationBar: AnimatedAppBar(),
    ):
    Scaffold(
      body: Center(
          child: Text(
            "Actualmente la aplicación está optimizada exclusivamente para la vista móvil.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          )
      ),
    );
  }
}