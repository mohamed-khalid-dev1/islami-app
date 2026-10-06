import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/features/layout/tabs/hadeth_tab/hadeth_details.dart';
import 'package:islami_app/features/layout/tabs/hadeth_tab/widgets/hadeth_card.dart';
import 'package:islami_app/models/hadeth.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      readHadethList();
    }
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/app_logo.png"),
            Expanded(
              child: CarouselSlider(
                items: hadethList
                    .map((hadeth) =>
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadethDetails.routName,
                              arguments: hadeth);
                        },
                        child: HadethCard(hadeth: hadeth)))
                    .toList(),
                options: CarouselOptions(
                  height: double.infinity,
                  enlargeCenterPage: true,
                  // enlargeStrategy:  CenterPageEnlargeStrategy.zoom
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> readHadethList() async {
    for (int i = 1; i <= 50; i++) {
      String hadeth = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      List<String> hadethContent = hadeth.trim().split("\n");
      hadethList.add(
        Hadeth(
          title: hadethContent[0],
          content: hadethContent[1],
          hadethNum: i.toString(),
        ),
      );
    }
    setState(() {});
  }
}
