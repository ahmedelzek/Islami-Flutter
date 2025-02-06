import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_flutter/model/hadith_model.dart';

import '../../../../utils/app_assets.dart';

class HadithPage extends StatefulWidget {
  int index;

  HadithPage({required this.index, super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  Hadith? hadith;

  @override
  void initState() {
    loadHadith(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppImages.hadithBackground))),
        child: hadith == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  hadithTitle(hadith?.title ?? " "),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Text(hadith?.content ?? " ",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget hadithTitle(String hadithTitle) {
    return Row(
      children: [
        Expanded(child: Image.asset(AppImages.hadithTitleDecoration)),
        Expanded(
          child: Text(
            hadithTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Transform.flip(
            flipX: true,
            child: Image.asset(AppImages.hadithTitleDecoration),
          ),
        ),
      ],
    );
  }

  Future<void> loadHadith(int index) async {
    var fileName = "assets/files/h${index}.txt";
    var fileContent = await rootBundle.loadString(fileName);
    int firstLineIndex = fileContent.indexOf("\n");
    String title = fileContent.substring(0, firstLineIndex);
    String content = fileContent.substring(firstLineIndex + 1);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      hadith = Hadith(title: title, content: content);
    });
  }
}
