import 'package:flutter/material.dart';

class MoreDetailsCard extends StatefulWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final double imageWidth;
  final double imageHeight;

  const MoreDetailsCard({
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  State<MoreDetailsCard> createState() => _MoreDetailsCardState();
}

class _MoreDetailsCardState extends State<MoreDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            width: widget.imageWidth,
            height: widget.imageHeight,
          ),
          Text(
            widget.text1,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            widget.text2,
            style: TextStyle(color: Colors.amber[700], fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
