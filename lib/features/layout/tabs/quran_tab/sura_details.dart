import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/sura.dart';

class SuraDetails extends StatefulWidget {
  static const String routName = "sura details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  Sura? sura;

  String suraDetails = "";
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    sura ??= ModalRoute.of(context)!.settings.arguments as Sura;
    if (suraDetails.isEmpty) {
      readSura(sura?.id ?? 0);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          sura?.suraNameEn ?? "",
        ),
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
                    sura?.suraNameAr ?? "",
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
                  children: ayat.map((aya) {
                    int index = ayat.indexOf(aya);
                    return TextSpan(
                      text: aya,
                      children: [
                        TextSpan(
                          text: " [${index + 1}] ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "jana",
                          ),
                        ),
                      ],
                    );
                  }).toList(),
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

  readSura(int id) async {
    suraDetails = await rootBundle.loadString("assets/suras/${id}.txt");
    ayat = suraDetails.trim().split("\n");
    // suraDetails = '';
    // for (int i = 0; i < ayat.length; i++) {
    //   suraDetails += ayat[i] + ' [${i + 1}] ';
    // }

    setState(() {});
  }
}
