import 'package:flutter/material.dart';
import 'package:hewa/models/bottomNavBar.dart';
import 'package:hewa/screen/home.dart';
import 'package:hewa/styles/decorColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 5), () => {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>  BotNav()))
    });
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        height: heights,
        width: widths,
        color: AppColor().mainColor,
        child: Stack(
          children: [
            Positioned(
              height: heights,
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hewa',
                      style: TextStyle(
                          color: AppColor().textColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.circle,
                      color: AppColor().iconColor,
                      size: 10,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                height: heights * 0.4,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor().submainCol,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(900.0, 120.0),
                          topLeft: Radius.elliptical(1500.0, 520.0))),
                ))
          ],
        ),
      ),
    );
  }
}
