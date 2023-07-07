import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/apiservice/group_service/get_all_groups_service.dart';
import 'package:bookingapp/apiservice/group_service/get_user_joined_group_service.dart';
import 'package:bookingapp/apiservice/group_service/join_group_service.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllGroupsProvider extends ChangeNotifier {
  List userDetails = [];
  List userGroups = [];

  bool isLoading = false;
  bool userGroupLoading = false;
  bool msgLoading = false;
  Future joinGroupButtonClick(context) async {
    isLoading = true;
    // final pref = await SharedPreferences.getInstance();
    userDetails = await GetAllGroupsSerive.getAllGroupsStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future joinGroup(context, groupId, groupName) async {
    await JoinGroupService.joinGroupStatus(
        context: context, groupId: groupId, groupName: groupName);
    notifyListeners();
  }

  Future getUserGroups(context) async {
    userGroupLoading = true;
    userGroups =
        await GetUserJoinedGroupService.getUserJoinedGroupStatus(context);
    userGroupLoading = false;
    notifyListeners();
  }

  List<dynamic> messages = [];

  Future<void> fetchGroupMessages(String groupId, context) async {
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
          messages = data['result'];
          notifyListeners();
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['status'], clr: kred);
        }
      } else {
        throw Exception('Failed to fetch group messages');
      }
    } catch (error) {
      throw Exception('Failed to fetch group messages: $error');
    }
  }
}
