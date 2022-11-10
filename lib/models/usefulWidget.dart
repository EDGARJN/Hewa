import 'package:flutter/material.dart';
import '../styles/decorColor.dart';

class DupliWidget {
  txt(val,size) {
    return Text(
      val,
      style: TextStyle(
          color: AppColor().textColor,
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}
