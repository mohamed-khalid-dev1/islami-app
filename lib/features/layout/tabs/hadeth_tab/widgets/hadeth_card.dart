import 'package:flutter/material.dart';
import 'package:islami_app/models/hadeth.dart';

import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/theme/app_colors.dart';

class HadethCard extends StatelessWidget {
  final Hadeth hadeth;

  const HadethCard({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_card.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/img_left_corner.png",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    hadeth.title,
                    style: context.appTextTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/img_right_corner.png',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
              child: Text(
                textDirection: TextDirection.rtl,
                hadeth.content,
                style: context.appTextTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  height: 1.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
