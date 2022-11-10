import 'package:flutter/material.dart';
import 'package:hewa/screen/home.dart';
import 'package:hewa/screen/search.dart';
import 'package:hewa/styles/decorColor.dart';

class BotNav extends StatefulWidget {
  String? data;
  BotNav({
    super.key,
    this.data
  });

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
 
  int index = 0;
 

  currentScreen(int length) {
    setState(() {
      index = length;
    });
  }

  @override
  Widget build(BuildContext context) {
   var pages = [RealHome(data: widget.data,), SearchScreen(id:1),SearchScreen(id: 0,)];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: currentScreen,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColor().textColor,
          selectedItemColor: AppColor().iconColor,
          backgroundColor: AppColor().mainColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.undo), label: '')
          ]),
      body: pages[index],
    );
  }
}
