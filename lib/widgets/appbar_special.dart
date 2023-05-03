import 'package:bunkapp/pags/vocabularycSreen.dart';
import 'package:flutter/material.dart';

class SpecialAppBar extends StatelessWidget{
  const SpecialAppBar({
    Key? key,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(
                    context, 
                     MaterialPageRoute(builder: (context) => vocabularyScreen())
                    );
                },
                icon: const Icon(Icons.menu_book_outlined)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}