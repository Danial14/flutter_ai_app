import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Prefs{
  static late final Box _box;
  static Future<void> initialize()async{
    Hive.init((await getApplicationDocumentsDirectory()).path);
    _box = await Hive.openBox("myBox");
  }
  static bool get showOnBoarding{
    return _box.get("showOnBoarding", defaultValue: true);
  }
  static set onBoarding(bool onBoarding){
    _box.put("showOnBoarding", onBoarding);
  }
}