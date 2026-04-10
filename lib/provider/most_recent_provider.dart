
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/tabs/Quran/shered_pref_utils.dart';

class MostRecentProvider extends ChangeNotifier{
  //todo: data
  List<int> mostRecentList =[];
  //todo: get last sura index => read data
  void getLastSuraIndex()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentlyListAsString =prefs.getStringList(SheredPrefUtils.mostRecentKey)??[];
//todo: List<String> =>List<int> => map()
    mostRecentList=mostRecentlyListAsString.map((element)=>int.parse(element)).toList().reversed.toList() ;
    //return mostRecentList.reversed.toList();
    notifyListeners() ;

  }

}