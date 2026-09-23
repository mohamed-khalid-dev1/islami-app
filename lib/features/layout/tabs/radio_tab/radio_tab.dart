import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/radio_bg.png"),fit: BoxFit.cover),
      ),
    );
  }
}
