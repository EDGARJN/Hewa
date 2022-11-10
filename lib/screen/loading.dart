import 'package:flutter/material.dart';
import 'package:hewa/models/bottomNavBar.dart';
import 'package:hewa/styles/decorColor.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    // Future.delayed(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const BotNav()));
    // });
    return Scaffold(
        backgroundColor: AppColor().mainColor,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColor().iconColor,
          ),
        ));
  }
}
