import 'package:flutter/material.dart';
import 'package:islami_flutter/model/surah_name_list.dart';

import '../../../../utils/app_assets.dart';

class MostRecentCard extends StatelessWidget {
  int surahIndex;
  MostRecentCard({required this.surahIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(6),
        child: Container(
          padding: EdgeInsets.all(10),
          width: 280,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            surahTexts(surahIndex, context),
            Image.asset(
              AppImages.quranCardDecoration,
              alignment: Alignment.centerRight,
              fit: BoxFit.cover,
            ),
          ]),
        ));
  }
}

Widget surahTexts(int index, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        QuranResource.englishQuranSurah[index],
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.black),
      ),
      Text(QuranResource.arabicQuranSurah[index],
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black)),
      Text(
        "${QuranResource.ayaNumbers[index]} Verses",
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black),
      )
    ],
  );
}
