import 'package:bunkapp/pags/kata_details.dart';
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
                      'Katas',
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
                kataList.length, 
                (index) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        kataList[index].name, 
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
                     MaterialPageRoute(builder: (context) => KataDetails(kata: kataList[index]))
                    );
                        }, 
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 193, 149, 251),
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