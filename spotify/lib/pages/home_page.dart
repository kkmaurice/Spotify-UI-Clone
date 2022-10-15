// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/json/songs_json.dart';
import 'package:spotify/pages/album_page.dart';
import 'package:spotify/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Explore',
              style: TextStyle(
                  fontSize: 20, color: white, fontWeight: FontWeight.bold),
            ),
            Icon(Entypo.list)
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                      children: List.generate(
                          song_type_1.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeMenu1 = index;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song_type_1[index],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: activeMenu1 == index
                                                ? primary
                                                : grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      activeMenu1 == index
                                          ? Container(
                                              height: 3,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(
                        songs.length - 5,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => AlbumPage(song: songs[index]))));  
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
                                      child: Text(
                                        songs[index]['description'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ),

            ],
          ),
           
         const SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                      children: List.generate(
                          song_type_2.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeMenu2 = index;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song_type_2[index],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: activeMenu2 == index
                                                ? primary
                                                : grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      activeMenu2 == index
                                          ? Container(
                                              height: 3,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => AlbumPage(song: songs[index]))));
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
                                      child: Text(
                                        songs[index]['description'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
