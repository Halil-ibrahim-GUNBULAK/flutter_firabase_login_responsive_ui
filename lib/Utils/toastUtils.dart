import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showShortToast({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
void showLongToast({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
void showToast({required String message,required Toast toastLength
,required ToastGravity gravity, required Color backgroundColor,required Color toastTextColor
,required double fontSize}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: toastTextColor,
      fontSize: fontSize
  );
}