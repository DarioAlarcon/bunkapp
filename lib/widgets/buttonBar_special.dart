import 'package:bunkapp/pags/katas_screen.dart';
import 'package:bunkapp/pags/tecniques_screen.dart';
import 'package:flutter/material.dart';

class SpecialButtonBar extends StatelessWidget{
  const SpecialButtonBar({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              IconButton(onPressed: () {}, 
              icon: const Icon(
                Icons.home_filled,
                size: 36,
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