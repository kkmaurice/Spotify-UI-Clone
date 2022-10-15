// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/json/songs_json.dart';
import 'package:spotify/pages/music_detail_page.dart';
import 'package:spotify/theme/colors.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({
    Key? key,
    required this.song,
  }) : super(key: key);
  final dynamic song;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: getBody(),
      ),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    List songAlum = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.song['img']),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.song['title'],style: TextStyle(fontSize: 18,fontWeight: 
                      FontWeight.bold,color: white),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                          child: Text('Subscribe',style: TextStyle(fontSize: 18,color: white,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(
                        songs.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => MusicDetailPage(title: songs[index]['title'], description: songs[index]['description'], color: songs[index]['color'], img: songs[index]['img'], songUrl: songs[index]['song_url']))));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  songs[index]['img']),
                                              fit: BoxFit.cover),
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      songs[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                        songs[index]['song_count'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        songs[index]['date'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              SizedBox(height: 20,),
          Column(
            children: List.generate(songAlum.length, (index) =>
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => MusicDetailPage(title: widget.song['title'], description: widget.song
                  ['description'], color: widget.song['color'], img: widget.song['img'], songUrl: widget.song['song_url']))));
                },
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 60) * 0.77,
                      height: 50,
                      child: Text("${index + 1}   " + songAlum[index]['title'],style: TextStyle(color: white,),),
                    ),
                    Container(
                      width: (size.width - 60) * 0.23,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(songAlum[index]['duration'],style: TextStyle(color: grey,),),
                          Icon(Icons.play_circle_outline,color: white,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ) 
            ),
          )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (() {
                Navigator.pop(context);
              }), 
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),),
              IconButton(onPressed: (() {
                Navigator.pop(context);
              }), 
              icon:  const Icon(Feather.more_vertical, color: Colors.white,),),
              
            ],
          )
        ]),
    );
  }
}