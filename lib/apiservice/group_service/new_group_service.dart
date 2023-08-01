import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewGroupService {
  static Future newGroupStatus({context, groupName}) async {
    final pref = await SharedPreferences.getInstance();
    final username = pref.getString("USER_NAME");
    // final userId = pref.getString("Id");
    final token = pref.getString('ACCESS_TOKEN');

    final String url = Urls.baseUrl + Urls.group + Urls.newGroup;
    Map<String, dynamic> body = {"adminName": username, "roomName": groupName};
    final respose = await http.post(Uri.parse(url),
        body: body, headers: {'x-access-token': token.toString()});
    final data = jsonDecode(respose.body);
    try {
      if (respose.statusCode == 200) {
        log("${respose.statusCode}");
        if (data['status'] == 'success') {
          log("success", name: "NewGroup");

          snackBarWidget(
              context: context, title: "New Group $groupName", clr: kGreen);
        } else {
          log(data['message']);
          snackBarWidget(context: context, title: data['message'], clr: kred);
        }
      } else {
        log("${respose.statusCode}");
        snackBarWidget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
