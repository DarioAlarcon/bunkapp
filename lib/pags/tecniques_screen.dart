import 'package:bunkapp/pags/techniques_detail.dart';
import 'package:bunkapp/widgets/animated_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bunkapp/models/technique_list.dart';
import '../widgets/button_special.dart';

class techniquesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _techniquesScreen();
  }
}

class _techniquesScreen extends State<techniquesScreen>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          headerTechnique(),
          Positioned(
            top: size.height * 0.15,
            right: size.height * 0.03,
            left: size.height * 0.03,
            bottom: 10,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [Column(
                children: List.generate(
                techniqueList.length, 
                (index) => Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
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
              SizedBox(height: 70,)
        ]
        )
            )
        ],
      ),
    );
  }

}


class headerTechnique extends StatelessWidget {
  const headerTechnique({
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
        title: Text(techniqueList[index].nombre, style: TextStyle(fontSize: 20),),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurpleAccent,),
      ),
    );
  }
}