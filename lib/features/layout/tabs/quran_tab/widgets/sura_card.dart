import 'package:flutter/material.dart';
import 'package:islami_app/models/sura.dart';

import '../../../../../core/theme/app_colors.dart';

class SuraCard extends StatelessWidget {
  final Sura sura;

  const SuraCard({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sura_icon.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              sura.id.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: "jana",
              ),
            ),
          ),
          SizedBox(width: 24),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontFamily: "jana",
                  ),
                ),
                SizedBox(height: 7),

                Text(
                  "${sura.ayaNum} Verses",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontFamily: "jana",
                  ),
                ),
              ],
            ),
          ),
          Text(
            sura.suraNameAr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontFamily: "jana",
            ),
          ),
        ],
      ),
    );
  }
}
