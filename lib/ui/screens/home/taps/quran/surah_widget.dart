import 'package:flutter/material.dart';
import 'package:islami_flutter/model/surah_name_list.dart';
import 'package:islami_flutter/ui/screens/surah/surah_details_screen.dart';
import 'package:islami_flutter/ui/utils/app_assets.dart';

import '../../../../widgets/shared_preferences_utils.dart';

class SurahWidget extends StatelessWidget {
  int surahIndex;
  VoidCallback onSurahSelected;

  SurahWidget(
      {required this.surahIndex, required this.onSurahSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context)
            .pushNamed(SurahDetailsScreen.routeName, arguments: surahIndex);
        await updateMostRecentSurah(surahIndex);
        onSurahSelected();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            surahNum(context, surahIndex),
            const SizedBox(
              width: 24,
            ),
            surahEnglishName(context, surahIndex),
            const Spacer(),
            Text(
              QuranResource.arabicQuranSurah[surahIndex],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

Widget surahNum(BuildContext context, int surahIndex) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage(AppImages.surahNumBackground))),
    child: Text(
      "${surahIndex + 1}",
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget surahEnglishName(BuildContext context, int surahIndex) {
  return Column(
    spacing: 12,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(QuranResource.englishQuranSurah[surahIndex],
          style: Theme.of(context).textTheme.bodyLarge),
      Text(
        "${QuranResource.ayaNumbers[surahIndex]} verses",
        style: Theme.of(context).textTheme.bodySmall,
      )
    ],
  );
}
