import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/Quran/widget/sura_item_widget.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
          ),
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: height*0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: height*0.02
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primaryColor
                    ),
                    child: Row(
                      spacing: width*0.04,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Al -Anbiya',
                            style: AppStyles.bold24black,),
                            Text('الأنبياء',
                              style: AppStyles.bold24black,),
                            Text('122 verse',
                              style: AppStyles.bold14black,),
                          ],
                        ),
                        Image.asset(AppAssets.suraImage)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(
                    width: width*0.04,
                  );
                },
                itemCount: 10),
          ),
          Text('Suras List',style: AppStyles.bold16White,),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  //todo: navigation to sura details screen
                  Navigator.of(context).pushNamed(AppRoutes.suraDetailsName , arguments: index) ;
                },
                child: SuraItemWidget(index: index,));
          },
              separatorBuilder:(context,index){
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.01),
              child: Divider(
                color: AppColor.whiteColor,
                thickness: 2,
                indent: width*0.06,
                endIndent: width*0.06,
              ),
            ) ;
              },
              itemCount: 114))


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
}
