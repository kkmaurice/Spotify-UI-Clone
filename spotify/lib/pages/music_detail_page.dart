

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/theme/colors.dart';

class MusicDetailPage extends StatefulWidget {
  const MusicDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
    required this.img,
    required this.songUrl,
  }) : super(key: key);
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  
    double _currentSliderValue = 20;
    
    // audio player here
    late AudioPlayer advancedPlayer;
    late AudioCache audioCache;
    bool isPlayer = true;
    @override
    void initState(){
      super.initState();
      initPlayer();
    }

    initPlayer(){
      advancedPlayer = AudioPlayer();
      audioCache = AudioCache(fixedPlayer: advancedPlayer);
      playSound(widget.songUrl);
    }

    playSound(localPath) async {
      await audioCache.play(localPath);
    }

    stopSound(localPath) async {
      Uri audioFile = await audioCache.load(localPath);
      await advancedPlayer.setUrl(audioFile.path);
      advancedPlayer.stop();
    }

    seekSound() async {
      Uri audioFile = await audioCache.load(widget.songUrl);
      await advancedPlayer.setUrl(audioFile.path);
      advancedPlayer.seek(const Duration(milliseconds: 2000));
    }

    @override
    void dispose(){
      super.dispose();
      stopSound(widget.songUrl);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: getAppBar(),
    ),
    body: getBody(),
    );
  }

  Widget getAppBar(){
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Feather.more_vertical
          ))
      ],
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                child: Container(
                  width: size.width-100,
                  height: size.width-100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: widget.color, blurRadius: 50, spreadRadius: 5, offset: const Offset(-10, 40)
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.cover)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: Icon(
                      AntDesign.addfolder,
                      color: white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          height: 150,
                          child: Text(
                            widget.description,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15, color: white.withOpacity(0.5)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      Feather.more_vertical,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Slider(
            value: _currentSliderValue,
            activeColor: primary, 
            min: 0,
            max: 200,
            onChanged: (value){
              setState(() {
                _currentSliderValue = value;
              });
              seekSound();
            }),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 35,right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1:50',
                    style: TextStyle(color: white.withOpacity(0.5)),
                  ),
                  Text(
                    '1:50',
                    style: TextStyle(color: white.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, 
                  icon: Icon(
                    Feather.shuffle,
                    color: white.withOpacity(0.8),
                    size: 25,
                  )),
                  IconButton(onPressed: (){}, 
                  icon: Icon(
                    Feather.skip_back,
                    color: white.withOpacity(0.8),
                    size: 25,
                  )),
                  IconButton(onPressed: (){
                    if (isPlayer){
                      stopSound(widget.songUrl);
                      setState(() {
                        isPlayer = false;
                      });
                    } else {
                      playSound(widget.songUrl);
                      setState(() {
                        isPlayer = true;
                      });
                    }
                  },
                  iconSize: 50, 
                  icon: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primary),
                      child: 
                      Center(
                        child: Icon(
                          isPlayer ? Entypo.controller_stop : Entypo.controller_play,
                          size: 28, 
                          color: white,)
                        ),
                  )),
                  IconButton(onPressed: (){}, 
                  icon: Icon(
                    Feather.skip_forward,
                    color: white.withOpacity(0.8),
                    size: 25,
                  )),
                  IconButton(onPressed: (){}, 
                  icon: Icon(
                    AntDesign.retweet,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ))
                ],
              ),
              ), 
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Feather.tv,
                    color: primary,
                    size: 20,
                  ),
                  SizedBox(width: 10,), 
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      'Chromecast is ready',
                      style: TextStyle(color: primary),
                    ),
                  )
                ],
              )
        ],
      ));
  }
}