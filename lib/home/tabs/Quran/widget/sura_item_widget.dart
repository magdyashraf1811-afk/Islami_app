import 'package:flutter/material.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class SuraItemWidget extends StatelessWidget {
  final int  index;
  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      spacing: width*0.06,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNum),
            Text('${index+1}',style: AppStyles.bold16White,)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishNames[index],style: AppStyles.bold20white,),
            Text('${QuranResources.versesCount[index]} Verses',style: AppStyles.bold14white,)
          ],
        ),
        Spacer(),
        Text(QuranResources.arabicName[index],style: AppStyles.bold20white,)
      ],
    );
  }
}
