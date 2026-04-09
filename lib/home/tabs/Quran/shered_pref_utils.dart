//todo save last sura index => write data
import 'package:shared_preferences/shared_preferences.dart';
class SheredPrefUtils{
  static const String mostRecentKey='most_recent';
}
void saveLastSuraIndex (int newSuraIndex)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get last sura index
 List<String> mostRecentList = prefs.getStringList(SheredPrefUtils.mostRecentKey)??[];
  //todo: add last sura index in mostRecentList
  //todo: duplicate
  if(mostRecentList.contains('$newSuraIndex')){
    //todo: index exist => remove => add
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.add('$newSuraIndex');
  }else{
    //todo: index not exist => add
    mostRecentList.add('$newSuraIndex');
    //todo limit
    if(mostRecentList.length>5){
      mostRecentList.removeLast();
    }

  }
  //todo: save list in shared prefs
  await prefs.setStringList( SheredPrefUtils.mostRecentKey,mostRecentList );

}
//todo: get last sura index => read data
Future<List<int>> getLastSuraIndex()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
List<String> mostRecentlyListAsString =prefs.getStringList(SheredPrefUtils.mostRecentKey)??[];
//todo: List<String> =>List<int> => map()
List<int> mostRecentList=mostRecentlyListAsString.map((element)=>int.parse(element)).toList() ;
return mostRecentList.reversed.toList() ;


}