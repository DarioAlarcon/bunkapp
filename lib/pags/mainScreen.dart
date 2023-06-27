import 'package:bunkapp/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/animated_navigation_bar.dart';

// ignore: camel_case_types
class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final layoutMOdel = Provider.of<LayoutModel>(context);
    return Scaffold(
      body: layoutMOdel.currentPage,
      bottomNavigationBar: AnimatedAppBar(),
    );
  }
}