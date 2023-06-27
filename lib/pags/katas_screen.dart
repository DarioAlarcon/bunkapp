import 'package:flutter/material.dart';
import 'package:bunkapp/pags/kata_details.dart';
import '../models/kataList.dart';

class KataScreen extends StatefulWidget{
  const KataScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _kataScreen();
  }
}

// ignore: camel_case_types
class _kataScreen extends State<KataScreen>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const headerKata(),
            bodyKataScreen(size: size)
          ],
        ),
      ),
    );
  }

}

// ignore: camel_case_types
class bodyKataScreen extends StatelessWidget {
  const bodyKataScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      right: size.height * 0.03,
      left: size.height * 0.03,
      bottom: 1,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [Column(
          children: List.generate(
          kataList.length, 
          (index) => Column(
            children: [
               const Padding(
                padding: EdgeInsets.only(right: 22),
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
        );
  }
}

// ignore: camel_case_types
class headerKata extends StatelessWidget {
  const headerKata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        top: 21,
        left: 16,
        right: 16,
        child: Row(
          children: [
            Text(
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

// ignore: camel_case_types
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
        title: Text(kataList[index].name, style: const TextStyle(fontSize: 20),),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurpleAccent,),
      ),
    );
  }
}