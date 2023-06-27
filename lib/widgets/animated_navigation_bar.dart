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
                  final layoutMOdel = Provider.of<LayoutModel>(context, listen: false);
                  bottomNavs[index].input!.change(true);
                  if (bottomNavs[index]!=selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs[index];
                    });
                  }
                  Future.delayed(const Duration(seconds: 1),(){
                      bottomNavs[index].input!.change(false);
                  });
                  layoutMOdel.currentPage = bottomNavs[index].page;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
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
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController controller =
                             RiveUtils.getRivecontroller(artboard,
                            stateMachineName: bottomNavs[index].stateMachineName,
                            );
                            bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                          },
                          ),
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
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAssets(this.src, this.page, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input
  });
  set setInput(SMIBool status){
    input=status;
  }
}
List bottomNavs = [
  RiveAssets(
    'assets/riveAssets/icons_animated.riv',
    const HomeScreen(),
    artboard: "HOME", 
    stateMachineName: "HOME_interactivity", 
    title: "home", 
  ),
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    const KataScreen(),
    artboard: "SEARCH", 
    stateMachineName: "SEARCH_Interactivity", 
    title: "search", 
  ),
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    const techniquesScreen(),
    artboard: "BELL", 
    stateMachineName: "BELL_Interactivity", 
    title: "home", 
  ),
  
  RiveAssets(
    'assets/riveAssets/icons_animated.riv', 
    const vocabularyScreen(),
    artboard: "USER", 
    stateMachineName: "USER_Interactivity", 
    title: "home", 
  ),
];