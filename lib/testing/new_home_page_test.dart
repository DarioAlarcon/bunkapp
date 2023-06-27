import 'package:bunkapp/models/layout_model.dart';
import 'package:bunkapp/pags/katas_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/animated_navigation_bar.dart';

class HomeTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final layoutMOdel = Provider.of<LayoutModel>(context);
    return Scaffold(
      body: layoutMOdel.currentPage,
      bottomNavigationBar: AnimatedAppBar(),
    );
  }
}