import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/details_hadeth_args.dart';
import 'package:islami_app/models/hadeth.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadethBackground)),
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColor.blackbgColor),
            )
          : InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.hadethDetailsScreen,
                  arguments: DetailsHadethArgs(
                    hadeth: hadeth!,
                    index: widget.index,
                  ),
                );
              },
              child: Column(
                spacing: height * 0.02,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppAssets.hadethLeftCorner,
                          width: width * 0.16,
                        ),
                        Expanded(
                          child: Text(
                            hadeth?.title ?? '',
                            textAlign: TextAlign.center,
                            style: AppStyles.bold24black,
                          ),
                        ),
                        Image.asset(
                          AppAssets.hadethRightCorner,
                          width: width * 0.16,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? '',
                        style: AppStyles.bold18Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.mosque,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeeth/Hadeeth/h$index.txt',
    );
    int fileIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileIndex);
    String content = fileContent.substring(fileIndex + 1);
    hadeth = Hadeth(content: content, title: title);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
