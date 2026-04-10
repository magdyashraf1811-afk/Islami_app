import 'package:flutter/material.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/images.dart';

class MostRecently extends StatefulWidget {
 const  MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
 late MostRecentProvider  mostRecentProvider ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //todo: this is bloc of code br execute before built

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //todo: this is bloc of code br execute after built
      mostRecentProvider.getLastSuraIndex();
    },);
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
     mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return
      Visibility(
        visible: mostRecentProvider.mostRecentList.isNotEmpty,
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
                    arguments: mostRecentProvider.mostRecentList[index]) ;
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

                            Text( QuranResources.englishNames[mostRecentProvider.mostRecentList[index]], style: AppStyles.bold24black),
                            Text(QuranResources.arabicNames[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold24black)  ,
                              Text('${QuranResources.versesCount[mostRecentProvider.mostRecentList[index]]}Verse',style: AppStyles.bold24black)
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
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
            ),
      );
  }
}
