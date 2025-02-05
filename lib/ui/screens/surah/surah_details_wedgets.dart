import 'package:flutter/material.dart';
import 'package:islami_flutter/model/surah_name_list.dart';
import 'package:islami_flutter/ui/utils/app_assets.dart';

Widget surahTitleWidget(BuildContext context, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Transform.flip(
        flipX: true,
        child: Image.asset(AppImages.surahTitleDecoration),
      ),
      Text(
        QuranResource.arabicQuranSurah[index],
        style: TextTheme.of(context).titleMedium,
      ),
      Image.asset(AppImages.surahTitleDecoration)
    ],
  );
}
