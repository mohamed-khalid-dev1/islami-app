import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/extensions.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turn = 0;
  int counter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/app_logo.png"),
            SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: context.appTextTheme.bodyMedium!.copyWith(fontSize: 30),
            ),
            SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset("assets/images/sebha_head.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.084),
                  child: AnimatedRotation(
                    turns: turn,
                    duration: Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          turn += 1 / 36;
                          counter++;
                          if (counter == 34) {
                            index++;
                            index == 4 ? index = 0 : null;
                            counter = 0;
                          }
                        });
                      },
                      child: Image.asset(
                        "assets/images/sebha_body.png",
                        height: size.height * .34,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Text(
                      azkar[index],
                      style: context.appTextTheme.bodyMedium!.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style: context.appTextTheme.bodyMedium!.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
