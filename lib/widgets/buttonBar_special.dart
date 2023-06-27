import 'package:bunkapp/pags/katas_screen.dart';
import 'package:bunkapp/pags/tecniques_screen.dart';
import 'package:bunkapp/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SpecialButtonBar extends StatefulWidget{
  const SpecialButtonBar({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  State<SpecialButtonBar> createState() => _SpecialButtonBarState();
}

class _SpecialButtonBarState extends State<SpecialButtonBar> {
  late SMIBool homeTrigger;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, 
                     MaterialPageRoute(builder: (context) => KataScreen())
                    );
              }, 
              icon: const Icon(
                Icons.sports_kabaddi,
                size: 36,
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeTrigger.change(true);
                  Future.delayed(Duration(seconds: 1),(){
                      homeTrigger.change(false);
                  });
                },
                child: SizedBox(
                  height: 43,
                  width: 43,
                  child: RiveAnimation.asset(
                    'assets/riveAssets/icons_animated.riv',
                    artboard: "HOME",
                    onInit: (artboard) {
                      StateMachineController controller =
                       RiveUtils.getRivecontroller(artboard,
                      stateMachineName: "HOME_interactivity",
                      );
                      homeTrigger = controller.findSMI("active") as SMIBool;
                    },
                    ),
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                     MaterialPageRoute(builder: (context) => techniquesScreen())
                    );
                },
                icon: const Icon(
                  Icons.sports_martial_arts_rounded,
                  size: 36,
                )
              )
          ],
        ),
        ),
      );
  }
}