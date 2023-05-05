import 'package:bunkapp/models/kata.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/button_special.dart';

class KataDetails extends StatefulWidget {
  final Kata kata;
  const KataDetails({Key? key, required this.kata,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _kataDetails();
  }
  
}
class _kataDetails extends State<KataDetails>{
  
late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.kata.video);
    _controller = YoutubePlayerController(initialVideoId: videoID!,
    flags: const YoutubePlayerFlags(
      autoPlay: false
    ));
    super.initState();
  }
  
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
                      widget.kata.name,
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
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () => debugPrint('ready'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(
                      widget.kata.dificultad,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "${widget.kata.pasos} pasos",
                      style: const TextStyle(
                        fontSize: 20,
                      ),

                    ),
              
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  width: 330,
                  height: 200,
                  child: Text(
                    widget.kata.description,
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