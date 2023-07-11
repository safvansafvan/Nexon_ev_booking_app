import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GroupMsgService {
  static Future getMsgStatus(context, groupId) async {
    final String url = Urls.baseUrl + Urls.group + Urls.getMsg;
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("ACCESS_TOKEN");
    try {
      final response = await http.post(Uri.parse(url),
          body: {'groupId': groupId},
          headers: {'x-access-token': token.toString()});

      if (response.statusCode == 200) {
        log("success");
        final data = jsonDecode(response.body);
        if (data['status'] == "success") {
          final messages = data['result'];
          return messages;
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        snakBarWiget(
            context: context,
            title: "failed to fetch group message",
            clr: kred);
      }
    } catch (error) {
      log('Failed to fetch group messages: $error');
    }
    return [];
  }
}
