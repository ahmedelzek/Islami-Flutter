import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/quran_tap_widgets.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/surah_widget.dart';

import '../../../../../model/surah_name_list.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextField(context),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => SurahWidget(surahIndex: index),
                separatorBuilder: (context, index) =>
                    separatorBuilderContainer(),
                itemCount: QuranResource.arabicQuranSurah.length))
      ],
    );
  }
}
