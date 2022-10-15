// ignore_for_file: prefer_const_constructors, unused_element, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/pages/home_page.dart';
import 'package:spotify/theme/colors.dart';

class RootApp extends StatefulWidget {
   const RootApp({ Key? key }) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab, 
      children: const [
        HomePage(),
        Center(
          child: Text('Library', style: TextStyle(fontSize: 25, color: Colors.white),),
        ),
        Center(
          child: Text('Search', style: TextStyle(fontSize: 25, color: Colors.white),),
        ),
        Center(
          child: Text('Settings', style: TextStyle(fontSize: 25, color: Colors.white),),
        )
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Feather.home,
      Feather.book,
      Feather.search,
      Feather.settings
    ];
  return Container(
    height: 80,
    color: black,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) => IconButton(
          icon: Icon(items[index],
          color: activeTab == index ? primary : white,
          ),
          onPressed: () {
            setState(() {
              activeTab = index;
            });
          },
        )),
      ),
    ),
  );
}

}

