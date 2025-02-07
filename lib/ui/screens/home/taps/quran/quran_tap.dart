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
  List<int> filteredSurahIndices = List.generate(114, (index) => index);

  @override
  void initState() {
    super.initState();
    getSavedMostRecentSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextField(context, filterSurahByText),
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
                itemBuilder: (context, index) =>
                    SurahWidget(surahIndex: filteredSurahIndices[index]),
                separatorBuilder: (context, index) =>
                    separatorBuilderContainer(),
                itemCount: filteredSurahIndices.length))
      ],
    );
  }

  void getSavedMostRecentSurah() async {
    var listIndices = await getMostRecentSurah();
    setState(() {
      mostRecentSurahIndices = listIndices;
    });
  }

  void filterSurahByText(String searchText) {
    List<int> filteredList = [];
    for (int i = 0; i < QuranResource.arabicQuranSurah.length; i++) {
      if (QuranResource.arabicQuranSurah[i]
              .toLowerCase()
              .contains(searchText.toLowerCase()) ||
          QuranResource.englishQuranSurah[i]
              .toLowerCase()
              .contains(searchText.toLowerCase())) {
        filteredList.add(i);
      }
    }
    setState(() {
      filteredSurahIndices = filteredList;
    });
  }
}
