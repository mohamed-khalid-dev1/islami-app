import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/hadeth.dart';
import 'package:islami_app/models/sura.dart';

class HadethDetails extends StatefulWidget {
  static const String routName = "hadeth details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    hadeth ??= ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Hadeth ${hadeth?.hadethNum}'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sura_details_bg.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/img_left_corner.png"),
                  Text(
                    hadeth?.title ?? "",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "jana",
                    ),
                  ),
                  Image.asset("assets/images/img_right_corner.png"),
                ],
              ),
              Text.rich(
                TextSpan(
                  text: hadeth?.content ?? "",
                  style: TextStyle(
                    fontFamily: "jana",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                    height: 2,
                  ),
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
