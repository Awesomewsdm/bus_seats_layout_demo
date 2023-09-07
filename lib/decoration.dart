import 'package:flutter/material.dart';

var kBackgroundBoxDecoration = const BoxDecoration(
  boxShadow: [
    BoxShadow(
        blurStyle: BlurStyle.outer,
        offset: Offset(0, 3),
        blurRadius: 2.0,
        spreadRadius: 5.0,
        color: Colors.black),
  ],
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(15.0),
  ),
);
