import 'dart:async';
import 'dart:developer';

import 'package:bookingapp/apiservice/group_service/get_all_groups_service.dart';
import 'package:bookingapp/apiservice/group_service/get_user_joined_group_service.dart';
import 'package:bookingapp/apiservice/group_service/group_msg_service.dart';
import 'package:bookingapp/apiservice/group_service/join_group_service.dart';
import 'package:bookingapp/apiservice/group_service/new_group_service.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: library_prefixes
import 'package:flutter/material.dart';

class GetAllGroupsProvider extends ChangeNotifier {
  List userDetails = [];
  List<Group> userGroups = [];
  List messages = [];
  final newGroupNameController = TextEditingController();
  bool isLoading = false;
  bool userGroupLoading = false;
  bool msgLoading = false;
  bool isMsgLoading = false;
  bool newGroupLoading = false;

  // GetAllGroupsProvider() {
  //   connect();
  // }

  Future joinGroupButtonClick(context) async {
    isLoading = true;
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

  addNewGroup(context) async {
    newGroupLoading = true;
    await NewGroupService.newGroupStatus(
        context: context, groupName: newGroupNameController.text);
    newGroupNameController.clear();
    newGroupLoading = false;
    notifyListeners();
  }

  Future<void> fetchGroupMessages({required String groupId, context}) async {
    isMsgLoading = true;
    messages = await GroupMsgService.getMsgStatus(context, groupId);
    isMsgLoading = false;
    notifyListeners();
  }

  getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    return name.toString();
  }
}
