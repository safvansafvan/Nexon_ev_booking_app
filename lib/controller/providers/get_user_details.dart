import 'package:shared_preferences/shared_preferences.dart';

class GetUserDetials {
  String? userName = "";
  String? userEmail = "";
  getUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString("USER_NAME");
  }

  Future getUSerEmail() async {
    final pref = await SharedPreferences.getInstance();
    userEmail = pref.getString("USER_EMAIL");
  }
}
