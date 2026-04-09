import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/Quran/details/sura_details_screen.dart';
import 'package:islami_app/home/tabs/Quran/shered_pref_utils.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/utils/app_routes.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/images.dart';

class MostRecently extends StatefulWidget {
 const  MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
List<int> mostRecentList =[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    readMostRecent();
  }
  void readMostRecent()async{
  mostRecentList =await getLastSuraIndex();
  setState(() {

  });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return
      Visibility(
        visible: mostRecentList.isNotEmpty,
        child: Column(
        spacing:  height*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.suraDetailsName,
                    arguments: mostRecentList[index]) ;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primaryColor,
                    ),
                    child: Row(
                      spacing: width * 0.04,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Text( QuranResources.englishNames[mostRecentList[index]], style: AppStyles.bold24black),
                            Text(QuranResources.arabicNames[mostRecentList[index]],style: AppStyles.bold24black)  ,
                              Text('${QuranResources.versesCount[mostRecentList[index]]}Verse',style: AppStyles.bold24black)
                             ],
                        ),
                        Image.asset(AppAssets.suraImage),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.04);
              },
              itemCount: mostRecentList.length,
            ),
          ),
        ],
            ),
      );
  }
}
