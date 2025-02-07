import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/most_recent_card.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/quran_tap_widgets.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/surah_widget.dart';

import '../../../../../model/surah_name_list.dart';
import '../../../../widgets/shared_preferences_utils.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> mostRecentSurahIndices = [];

  @override
  void initState() {
    super.initState();
    getSavedMostRecentSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextField(context),
        Visibility(
          visible: mostRecentSurahIndices.isNotEmpty,
          child: SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mostRecentSurahIndices.length,
                itemBuilder: (context, index) {
                  return MostRecentCard(
                    surahIndex: mostRecentSurahIndices[index],
                  );
                }),
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => SurahWidget(surahIndex: index),
                separatorBuilder: (context, index) =>
                    separatorBuilderContainer(),
                itemCount: QuranResource.arabicQuranSurah.length))
      ],
    );
  }

  void getSavedMostRecentSurah() async {
    var listIndices = await getMostRecentSurah();
    setState(() {
      mostRecentSurahIndices = listIndices;
    });
  }
}
