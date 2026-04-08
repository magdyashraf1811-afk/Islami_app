import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String suraContent;

   const SuraContent({
    super.key,
    required this.suraContent,


  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.03 ,
        vertical: height*0.01


      ),
      child: Text(suraContent,
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
