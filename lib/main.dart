import 'package:flutter/material.dart';
import 'package:mobilecomputing/view/Splash.dart';

void main() {
 runApp(MyApp());
 /* runApp(
    DevicePreview(
     enabled: !kReleaseMode
    ,builder: ((context)=>const MyApp()),));*/
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSplash(),
      ),
    );
  }
}