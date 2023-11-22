import 'package:shared_preferences/shared_preferences.dart';

Future<String> getStoredData(String value) async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString(value).toString();
}
