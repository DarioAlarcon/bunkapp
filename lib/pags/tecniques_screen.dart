import 'package:flutter/material.dart';

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

        ],
      ),
    );
  }

}