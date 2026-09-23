import 'package:flutter/material.dart';
import 'package:islami_app/core/app_const/app_const.dart';
import 'package:islami_app/core/extensions/extensions.dart';
import 'package:islami_app/features/layout/tabs/quran_tab/sura_details.dart';
import 'package:islami_app/features/layout/tabs/quran_tab/widgets/sura_card.dart';
import 'package:islami_app/features/layout/tabs/quran_tab/widgets/sura_search_text_field.dart';
import 'package:islami_app/models/sura.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController search = TextEditingController();
  List<Sura> quran = [];
  List<Sura> searched = [];

  @override
  void initState() {
    super.initState();
    readQuran();
    search.addListener(() {
      if (search.text.isEmpty) {
        searched = quran;
      } else {
        searched = quran
            .where(
              (sura) =>
                  sura.suraNameEn.trim().toLowerCase().contains(
                    search.text.trim().toLowerCase(),
                  ) ||
                  sura.suraNameAr.trim().contains(search.text.trim()),
            )
            .toList();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/app_logo.png")),
            SizedBox(height: 21),
            SuraSearchTextField(controller: search),
            SizedBox(height: 20),
            Text("Suras List", style: context.appTextTheme.bodyMedium),
            Expanded(
              child: ListView.separated(
                itemCount: searched.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetails.routName,
                        arguments: searched[index],
                      );
                    },
                    child: SuraCard(sura: searched[index]),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(indent: 20, endIndent: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readQuran() {
    for (int i = 0; i < arabicAuranSuras.length; i++) {
      quran.add(
        Sura(
          id: i + 1,
          suraNameAr: arabicAuranSuras[i],
          suraNameEn: englishQuranSurahs[i],
          ayaNum: AyaNumber[i],
        ),
      );
    }
    searched = quran;
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }
}
