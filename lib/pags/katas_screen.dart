import 'package:bunkapp/pags/kata_details.dart';
import 'package:bunkapp/widgets/animated_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../models/kataList.dart';
import '../widgets/button_special.dart';

class KataScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _kataScreen();
  }
}

class _kataScreen extends State<KataScreen>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            headerKata(),
            Positioned(
              top: size.height * 0.15,
              right: size.height * 0.03,
              left: size.height * 0.03,
              bottom: 1,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [Column(
                  children: List.generate(
                  kataList.length, 
                  (index) => Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Divider(
                          color: Colors.white24,
                          height: 4,
                        ),
                      ),
                      listTileKata(index: index),
                    ],
                  ),
                  
                ),
                ),
                ]
                )
                )
          ],
        ),
      ),
    );
  }

}

class headerKata extends StatelessWidget {
  const headerKata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 21,
        left: 16,
        right: 16,
        child: Row(
          children: [
            const Text(
              'Katas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34
              ),
            ),
          ],
        ),
          );
  }
}

class listTileKata extends StatelessWidget {
  const listTileKata({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
           MaterialPageRoute(builder: (context) => KataDetails(kata: kataList[index],))
          );
      },
      child: ListTile(
        title: Text(kataList[index].name, style: TextStyle(fontSize: 20),),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurpleAccent,),
      ),
    );
  }
}