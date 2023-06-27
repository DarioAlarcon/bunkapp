import 'package:bunkapp/pags/techniques_detail.dart';
import 'package:flutter/material.dart';
import 'package:bunkapp/models/technique_list.dart';

// ignore: camel_case_types
class techniquesScreen extends StatefulWidget{
  const techniquesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _techniquesScreen();
  }
}

// ignore: camel_case_types
class _techniquesScreen extends State<techniquesScreen>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const headerTechnique(),
          bodyTechniqueScreen(size: size)
        ],
      ),
    );
  }

}

// ignore: camel_case_types
class bodyTechniqueScreen extends StatelessWidget {
  const bodyTechniqueScreen({
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
          techniqueList.length, 
          (index) => Column(
            children: [
              
              const Padding(
                padding: EdgeInsets.only(right: 22),
                child: Divider(
                  color: Colors.white24,
                  height: 4,
                ),
              ),
              listTileTecnique( index: index,),
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
class headerTechnique extends StatelessWidget {
  const headerTechnique({
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
              'Tecnicas',
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
class listTileTecnique extends StatelessWidget {
  const listTileTecnique({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
           MaterialPageRoute(builder: (context) => TechniquesDetails(techniques: techniqueList[index],))
          );
      },
      child: ListTile(
        title: Text(techniqueList[index].nombre, style: const TextStyle(fontSize: 20),),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurpleAccent,),
      ),
    );
  }
}