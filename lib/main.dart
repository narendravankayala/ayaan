import 'package:ayaan/particle_builder.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import "dart:math";


void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache _audioCache;

//  Particles _particles;

  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.RELEASE));
//    _particles = new Particles(20);
  }

  @override
  Widget build(BuildContext context) {
    List<String> _listImages = [
      "assets/images/daddy.jpeg",
      "assets/images/mummy.jpeg",
      "assets/images/5.gif"
    ];
    List<String> _listAudio = ["daddy.mp3", "mummy.mp3", "swing.mp3"];
    List<String> _effects = [
      "assets/images/bubble.gif",
      "assets/images/lig.gif",
      "assets/images/colors.gif"
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Ayaan")),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: _listImages.length,
                    itemBuilder: (_, index) {
                      return Stack(children: <Widget>[
                        new GestureDetector(
                            onTap: () =>
                                _audioCache.play(_listAudio[index]),
                            child:
                            Image.asset(
                              _listImages[index],
                              fit: BoxFit.cover,
                              // this is the solution for border
                              width: 1000.0,
                              height: 1000.0,
                            )
                        ),
                        Opacity(
                            opacity: 0.4,
                            child: new GestureDetector(

                                ///Users/nkv/ayaan/assets/audio/pronunciation_en_swing.mp3

                                onTap: () =>
                                    _audioCache.play(_listAudio[index]),
                                // handle your image tap here
                                child: new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    _effects[index],
                                    fit: BoxFit.fill,
                                    // this is the solution for border
                                    width: 1000.0,
                                    height: 1000.0,
                                  ),
                                ))),
                       ]);
                    }))));
  }
}
