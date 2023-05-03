import 'package:flutter/material.dart';
import 'package:bunkapp/models/dataWord.dart';
import '../widgets/button_special.dart';

class vocabularyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _vocabularyScreen();
  }
}

class _vocabularyScreen extends State<vocabularyScreen>{
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
                      'Vocabulario',
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
                listWords.length, 
                (index) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(listWords[index].word, style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(width: 30,),
                      SizedBox(width: 200, child: Text(listWords[index].translation))
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