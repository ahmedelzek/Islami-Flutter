import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_flutter/model/surah_name_list.dart';
import 'package:islami_flutter/ui/screens/surah/surah_details_widgets.dart';
import 'package:islami_flutter/ui/utils/app_assets.dart';
import 'package:islami_flutter/ui/widgets/shared_preferences_utils.dart';

class SurahDetailsScreen extends StatefulWidget {
  static const String routeName = "surah";

  const SurahDetailsScreen({super.key});

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    int surahIndex = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadContent(surahIndex);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResource.englishQuranSurah[surahIndex]),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          surahTitleWidget(context, surahIndex),
          Expanded(
              child: suraContent.isEmpty
                  ? buildLoader()
                  : SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          suraContent,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    )),
          Image.asset(AppImages.surahFooterDecoration)
        ],
      ),
    );
  }

  Center buildLoader() => const Center(child: CircularProgressIndicator());

  Future<void> loadContent(int index) async {
    var fileName = "assets/files/${index + 1}.txt";
    suraContent = await rootBundle.loadString(fileName);
    List<String> suraLines = suraContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      if (suraLines[i].isNotEmpty) suraLines[i] += "{${i + 1}}";
    }
    await Future.delayed(const Duration(seconds: 1));
    await getMostRecentSurah();
    setState(() {
      suraContent = suraLines.join();
    });
  }
}
