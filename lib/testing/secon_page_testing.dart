
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = "https://www.youtube.com/watch?v=MA9830-UicE&ab_channel=Meirinkan-ArtesMarcialesparatodos";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      )
    );

  }

  @override
  void deactivate(){
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
    player: YoutubePlayer(
      controller: controller
    ), 
    builder: (context, player)=>Scaffold(
      appBar: AppBar(title: const Text('player video')),
      body: SafeArea(
        child: ListView(
          children: [
            player
          ],
        ),
      ),
    )
    );
}