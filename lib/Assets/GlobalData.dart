import 'package:ascii_emoji/Assets/Emoticons.dart';
import 'package:ascii_emoji/Libraries/SharedPreferencesClass.dart';

bool globalSortByUsage = true;
bool globalShowFavoritesOnTop = false;
bool startBuild = false;

List<String> emoticonsState = [];

int getCount(int i) {
  int count = int.parse(emoticonsState[i].substring(0, emoticonsState[i].length - 1));
  assert(count is int);
  return count;
}

bool getFavorite(int i) {
  return (emoticonsState[i].endsWith('t') ? true : false);
}

void downloadList(){
  for (int i=0; i<emoticonsList.length; i++){
    if (emoticonsState[i] != null) {
      emoticonsList[i].count = getCount(i);
      emoticonsList[i].favorite = getFavorite(i);
    }
    else{
      print("no object to update");
    }
  }
}

void updatePreferences(int i){
  emoticonsState[i] = emoticonsList[i].count.toString() + (emoticonsList[i].favorite ? 't' : 'f');
  SharedPreferencesManager().saveEmoticonsState(emoticonsState);
  print(emoticonsState.toString());
}