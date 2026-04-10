import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/Quran/shered_pref_utils.dart';
import 'package:islami_app/home/tabs/Quran/widget/most_recently.dart';
import 'package:islami_app/home/tabs/Quran/widget/sura_item_widget.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          TextField(
            cursorColor: AppColor.primaryColor,
            style: TextStyle(color: AppColor.whiteColor),
            decoration: InputDecoration(
              enabledBorder: buildDecorationBorder(),
              focusedBorder: buildDecorationBorder(),
              prefixIcon: Image.asset(AppAssets.searchIcon),
              hintText: 'sura name',
              hintStyle: AppStyles.bold16White,
            ),
            onChanged: (nexText) {
              searchByNesText(nexText);
            },
          ),
          MostRecently(),
          Text('Suras List', style: AppStyles.bold16White),
          Expanded(
            child:
            filterList.isEmpty?
                Center(child: Text('NO Sura Item Found',
                style:
                  AppStyles.bold20white,)):

            ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: save last sura index
                    saveLastSuraIndex(filterList[index]) ;
                    //todo: navigation to sura details screen
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItemWidget(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: Divider(
                    color: AppColor.whiteColor,
                    thickness: 2,
                    indent: width * 0.06,
                    endIndent: width * 0.06,
                  ),
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
    );
  }

  void searchByNesText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishNames.length; i++) {
      if (QuranResources.englishNames[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        filterSearchList.add(i);
      }
    }
    for (int i = 0; i < QuranResources.arabicName.length; i++) {
      if (QuranResources.arabicName[i].contains(newText)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
