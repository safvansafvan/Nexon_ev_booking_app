import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllGroupsSerive {
  static Future getAllGroupsStatus(context) async {
    final pref = await SharedPreferences.getInstance();
    final id = pref.getString('Id');
    final token = pref.getString('ACCESS_TOKEN');
    Map<String, dynamic> body = {"id": id};
    final url = Urls.baseUrl + Urls.group + Urls.getGroup;
    final respose = await http.post(Uri.parse(url),
        body: body, headers: {'x-access-token': token.toString()});
    final data = jsonDecode(respose.body);
    try {
      if (respose.statusCode == 200) {
        log("${respose.statusCode}");
        if (data['status'] == 'success') {
          final groupDetails = data['result'];
          log("success", name: "get groups");
          return groupDetails;
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
