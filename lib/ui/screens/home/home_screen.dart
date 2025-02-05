import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/home_widgets.dart';
import 'package:islami_flutter/ui/screens/home/taps/hadith/hadith_tap.dart';
import 'package:islami_flutter/ui/screens/home/taps/quran/quran_tap.dart';
import 'package:islami_flutter/ui/screens/home/taps/radio/radio_tap.dart';
import 'package:islami_flutter/ui/screens/home/taps/sepha/sepha_tap.dart';
import 'package:islami_flutter/ui/screens/home/taps/time/time_tap.dart';

import '../../utils/app_assets.dart';
import '../../widgets/custom_scaffold_container.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldContainer(
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              items: generateBottomNavItems({
                AppIcons.quranIcon: 'Quran',
                AppIcons.hadithIcon: 'Hadith',
                AppIcons.sephaIcon: 'Sepha',
                AppIcons.radioIcon: 'Radio',
                AppIcons.timeIcon: 'Time',
              })),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              homeLogo(),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: taps[selectedIndex])
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> taps = [
    const QuranTap(),
    const HadithTap(),
    const SephaTap(),
    const RadioTap(),
    const TimeTap(),
  ];
}
