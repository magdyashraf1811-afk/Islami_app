import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class SebhaTab extends StatefulWidget {
 const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> zkerList = ['سبحان الله', 'الحمدالله', 'الله اكبر'];
  int index = 0;
  int counter = 0;
  int angle =0 ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppStyles.bold36White,
          ),
          SizedBox(height: height * 0.01),
          GestureDetector(
            onTap: () {
              counter++;
              angle++;
              if(counter%33==0){
                index++;
                counter=0;
                if(index==zkerList.length){
                  index=0;
                  counter=0;
                }
              }
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(AppAssets.sebha),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.08),
                      child: Transform.rotate(
                        angle: angle /1,
                          child: Image.asset(AppAssets.sebhaBody)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(zkerList[index], style: AppStyles.bold36White),
                          Text('$counter', style: AppStyles.bold36White),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
