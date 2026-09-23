import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/sebha_bg.png"),fit: BoxFit.cover),
      ),
    );
  }
}
