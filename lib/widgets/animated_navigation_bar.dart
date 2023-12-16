import 'package:bunkapp/pags/katas_screen.dart';
import 'package:bunkapp/pags/tecniques_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_utils.dart';
import '../models/layout_model.dart';
import '../pags/vocabularycSreen.dart';
import '../pags/homeScreen.dart';

class AnimatedAppBar extends StatefulWidget {
  const AnimatedAppBar({super.key});

  
  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  RiveAssets selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24,
        vertical: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(210, 22, 22, 22),
          borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(bottomNavs.length, 
            (index) => GestureDetector(
                onTap: () {
                  print(bottomNavs[index].input);
                  final layoutMOdel = Provider.of<LayoutModel>(context, listen: false);
                  setState((){
                    selectedBottomNav = bottomNavs[index];
                  });
                  layoutMOdel.currentPage = bottomNavs[index].page;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.only(bottom: 2),
                      height: 4,
                      width: bottomNavs[index]==selectedBottomNav?20:0,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ), 
                    ),
                    SizedBox(
                      height: 43,
                      width: 43,
                      child: Opacity(
                        opacity: bottomNavs[index]==selectedBottomNav?1:0.5,
                        child: Icon(
                          bottomNavs[index].icondata,
                          color: Colors.white,
                          size: 32,
                        )
                      ),
                    ),
                  ],
                ),
              ),
          )
            ],
        ),
      ),
    );
  }
}

class RiveAssets{
  final Widget page;
  final IconData icondata;
  late SMIBool? input;
  RiveAssets( this.page, {
    required this.icondata,
    this.input
  });
  set setInput(SMIBool status){
    input=status;
  }
}
List bottomNavs = [
  RiveAssets(
    const HomeScreen(),
    icondata: Icons.home_filled,
  ),
  RiveAssets(
    const KataScreen(), 
    icondata: Icons.sports_kabaddi_rounded,
     
  ),
  RiveAssets(
    const techniquesScreen(), 
    icondata: Icons.sports_martial_arts_rounded,
     
  ),
  
  RiveAssets(
    const vocabularyScreen(),
    icondata: Icons.menu_book
  ),
];