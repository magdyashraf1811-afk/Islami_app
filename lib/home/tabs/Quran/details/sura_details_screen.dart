import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/Quran/details/sura_content.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/images.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = '';
  late MostRecentProvider mostRecentProvider ;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getLastSuraIndex();

  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider=Provider.of<MostRecentProvider>(context);
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        title: Text(
          QuranResources.englishNames[index],
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
                      QuranResources.arabicName[index],
                      style: AppStyles.bold24primary,
                    ),
                    Image.asset(AppAssets.rightCorner),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SuraContent(suraContent: suraContent),
                ),
              ),
              Image.asset(AppAssets.bottomDecoration),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );

    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += ' [${i + 1}] ';
    }
    suraContent = lines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
