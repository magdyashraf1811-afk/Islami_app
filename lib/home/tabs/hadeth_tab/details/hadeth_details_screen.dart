import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/Quran/details/sura_content.dart';
import 'package:islami_app/models/details_hadeth_args.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    DetailsHadethArgs args = ModalRoute.of(context)?.settings.arguments as DetailsHadethArgs;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        title: Text(
          'Hadeth ${args.index}' ,
          style: AppStyles.bold20primary,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.leftCorner),
                    Text(
                      args.hadeth.title,
                      style: AppStyles.bold24primary,
                    ),
                    Image.asset(AppAssets.rightCorner),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SuraContent(suraContent: args.hadeth.content),
                ),
              ),
              Image.asset(AppAssets.bottomDecoration),
            ],
          ),
        ],
      ),
    );
  }

}
