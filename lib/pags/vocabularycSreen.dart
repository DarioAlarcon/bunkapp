import 'package:flutter/material.dart';
import 'package:bunkapp/models/dataWord.dart';

// ignore: camel_case_types
class vocabularyScreen extends StatefulWidget {
  const vocabularyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _vocabularyScreen();
  }
}

// ignore: camel_case_types
class _vocabularyScreen extends State<vocabularyScreen>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const header(),
          wordList(size: size)
        ],
      ),
    );
  }

}

// ignore: camel_case_types
class wordList extends StatelessWidget {
  const wordList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.22,
      right: size.height * 0.03,
      left: size.height * 0.03,
      bottom: 10,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [Column(
          children: List.generate(
          listWords.length, 
          (index) => Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(listWords[index].word, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 30,),
                SizedBox(width: 200, child: Text(listWords[index].translation))
              ],
            ),
          ),
          
          ),
        ),
        ])
      );
  }
}

// ignore: camel_case_types
class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
          top: kToolbarHeight,
          left: 16,
          right: 16,
          child: Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                    'Vocabulario',
                    style: TextStyle(
                      fontSize: 34
                    ),
                  )
                  ],
                ),
                
            ],
          ),
    );
  }
}