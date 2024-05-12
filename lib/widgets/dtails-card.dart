import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const DetailsCard ({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          width: 100,
          height: 90,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 241, 241),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
        )
      ],);}
}