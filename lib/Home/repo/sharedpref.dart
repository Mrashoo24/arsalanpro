import 'dart:convert';

import 'package:arsalanpro/Home/models/taskmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefCustom {
  static SharedPreferences? _prefs;

  static setStringToPref(String key, var value) async {
    SharedPreferences sharedPreferences = await getShared();
    sharedPreferences.setString(key, value);
  }

  static setTaskToPref(String key, List<TaskModel> value) async {
    setStringToPref(key, json.encode(value));
  }

  static Future<List<TaskModel>?> getTaskFromPref(String key) async {
    String? data = await getStringFromPref(key);
    if (data == null) {
      return null;
    }
    print('data = $data');

     List listoftask = jsonDecode(data);

    List<TaskModel> listOfaskModel =  listoftask.map((e) {
       return TaskModel.fromJson(e);
     }).toList();


    return listOfaskModel;
  }


  static Future<String?> getStringFromPref(String key) async {
    String? value;

    try {
      SharedPreferences sharedPreferences = await getShared();

      value = sharedPreferences.getString(key);
    } catch (e) {
      return null;
    }
    return value;
  }


  static Future<SharedPreferences> getShared() async {
    return _prefs ?? await SharedPreferences.getInstance();
  }
}
