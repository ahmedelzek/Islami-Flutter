import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/quran_tap_widgets.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/surah_widget.dart';

import '../../../../../model/surah_name_list.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filteredSurahIndices = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextField(context, filterSurahByText),
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
