import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

Widget searchTextField(BuildContext context, Function filterSurahByText) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
        onChanged: (searchText) {
          filterSurahByText(searchText);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.gold),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.gold,
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12.0),
          ),
        )),
  );
}

Widget separatorBuilderContainer() {
  return Container(
    height: 1,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 50),
    color: Colors.white,
  );
}
