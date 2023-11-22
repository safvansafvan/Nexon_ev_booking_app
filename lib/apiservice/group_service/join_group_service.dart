import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/functions.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';

class JoinGroupService {
  static Future joinGroupStatus({context, groupId, groupName}) async {
    final username = await getStoredData('USER_NAME');
    final userId = await getStoredData('Id');
    final token = await getStoredData('ACCESS_TOKEN');
    final String url = Urls.baseUrl + Urls.group + Urls.joinGroup;
    Map<String, dynamic> body = {
      "userName": username,
      "userId": userId,
      "groupId": groupId
    };
    final respose = await http.post(Uri.parse(url),
        body: body, headers: {'x-access-token': token.toString()});
    final data = jsonDecode(respose.body);
    try {
      if (respose.statusCode == 200) {
        log("${respose.statusCode}");
        if (data['status'] == 'success') {
          log("success", name: "get groups");
          Navigator.pop(context);
          snackBarWidget(
              context: context, title: "Joined $groupName", clr: kGreen);
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
