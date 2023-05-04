import 'package:bunkapp/models/techniques.dart';
import 'package:flutter/material.dart';

import '../widgets/button_special.dart';

class TechniquesDetails extends StatefulWidget{
  final Techniques techniques;
  const TechniquesDetails({Key? key, required this.techniques,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _techniquesDetails();
  }

}

class _techniquesDetails extends State<TechniquesDetails>{
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
                    Text(
                      widget.techniques.nombre,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold
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
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  width: 350,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(
                      widget.techniques.tipo,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
              
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                  width: 330,
                  height: 220,
                  child: Text(
                    widget.techniques.description,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}