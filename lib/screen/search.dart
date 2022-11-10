import 'package:flutter/material.dart';
import 'package:hewa/models/bottomNavBar.dart';
import 'package:hewa/screen/home.dart';
import 'package:hewa/screen/loading.dart';
import 'package:hewa/service/waiter.dart';

import '../models/usefulWidget.dart';
import '../styles/decorColor.dart';

class SearchScreen extends StatefulWidget {
  int id;
  SearchScreen({
    super.key,
    required this.id
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final formKey = GlobalKey<FormState>();
  String? searchTxt;

  void searchActivity() {
    if (formKey.currentState!.validate()) {
      Waiter().getData(searchTxt);
      print(searchTxt);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BotNav(data: searchTxt)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().mainColor,
        elevation: 0.0,
      ),
      body: Container(
        height: heights,
        width: widths,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [AppColor().mainColor, AppColor().submainCol])),
        child: Stack(
          children: [
            Positioned(
              height: heights,
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DupliWidget().txt('Hewa', 27.0),
                      Icon(
                        Icons.circle,
                        color: AppColor().iconColor,
                        size: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: heights * 0.07,
                  ),
                  widget.id == 1?
                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: heights * 0.18,
                            padding: const EdgeInsets.only(
                                top: 40.0,
                                left: 40.0,
                                right: 40.0,
                                bottom: 40.0),
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  searchTxt = val;
                                });
                              },
                              validator: (val) => val!.isEmpty
                                  ? "Please Enter City name"
                                  : null,
                              cursorColor: AppColor().textColor,
                              decoration: InputDecoration(
                                  hintText: 'Enter city name to search',
                                  hintStyle:
                                      TextStyle(color: AppColor().textColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor().textColor,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor().textColor,
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 120.0, right: 120.0),
                            child: MaterialButton(
                              onPressed: () {
                                searchActivity();
                              },
                              height: heights * 0.06,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: AppColor().iconColor,
                              child: Row(
                                children: [
                                  Icon(Icons.search,
                                      color: AppColor().textColor),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                        color: AppColor().textColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )): Center(child: DupliWidget().txt('Welcome to the Hewa\n THe Home of Weather infos.',15.0),)
                ],
              ),
            ),
            // Positioned(
            //     bottom: 0,
            //     height: heights * 0.4,
            //     right: 0,
            //     left: 0,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: AppColor().submainCol,
            //           borderRadius: BorderRadius.only(
            //               topRight: Radius.elliptical(900.0, 120.0),
            //               topLeft: Radius.elliptical(1500.0, 520.0))),
            //     ))
          ],
        ),
      ),
    );
    ;
  }
}
