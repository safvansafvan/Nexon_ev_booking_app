import 'dart:convert';
import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/model/chatmodel.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GroupMsgService {
  static Future<List<ChatModel>?> getMsgStatus(context, groupId) async {
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
          List<ChatModel> messageList = (data['result'] as List)
              .map((e) => ChatModel.fromJson(e))
              .toList();
          return messageList;
        } else {
          log(data['status']);
          snackBarWidget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        snackBarWidget(
            context: context,
            title: "failed to fetch group message",
            clr: kred);
      }
    } catch (error) {
      log('Failed to fetch group messages: $error');
    }
    return null;
  }
}
