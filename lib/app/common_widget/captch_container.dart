import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;

  const CustomTextWidget({super.key, required this.text, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200, // Adjust width as needed
      height: height ?? 100, // Adjust height as needed
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey[600]!, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 3), // Shadow position
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18, // Adjust size as needed
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 3.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
