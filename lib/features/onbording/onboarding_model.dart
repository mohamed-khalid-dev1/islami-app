import 'package:flutter/material.dart';

class OnboardingModel extends StatelessWidget {
  final String image;
  final String title;
  final String? des;

  const OnboardingModel({
    super.key,
    required this.image,
    required this.title,
    this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        if (des != null)
          Text(
            des!,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 20, height: 2),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
