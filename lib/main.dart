import 'package:bus_seats_layout_demo/bus_selection_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeatSelectionScreen(),
    );
  }
}
