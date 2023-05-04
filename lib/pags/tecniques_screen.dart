import 'package:bunkapp/pags/techniques_detail.dart';
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
            Positioned(
                top: kToolbarHeight,
                left: 16,
                right: 16,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Specialbutton(
                    ontap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                    ),
                    ),
                    const Text(
                      'Tecnicas',
                      style: TextStyle(
                        fontSize: 34
                      ),
                    )
                    ],
                  ),
          ),
          Positioned(
            top: size.height * 0.22,
            right: size.height * 0.03,
            left: size.height * 0.03,
            bottom: 10,
            child: ListView(
              children: [Column(
                children: List.generate(
                techniqueList.length, 
                (index) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        techniqueList[index].nombre, 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                          ),
                          ),
                      const SizedBox(width: 30,),
                      IconButton(
                        onPressed: (){
                          Navigator.push(
                    context, 
                     MaterialPageRoute(builder: (context) => TechniquesDetails(techniques: techniqueList[index],))
                    );
                        }, 
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                
                ),
              ),
        ])
            )
        ],
      ),
    );
  }

}