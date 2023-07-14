import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bookingapp/apiservice/group_service/edit_group_service.dart';
import 'package:bookingapp/apiservice/group_service/get_all_groups_service.dart';
import 'package:bookingapp/apiservice/group_service/get_user_joined_group_service.dart';
import 'package:bookingapp/apiservice/group_service/join_group_service.dart';
import 'package:bookingapp/apiservice/group_service/new_group_service.dart';
import 'package:bookingapp/model/group_model.dart';
// ignore: library_prefixes
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetAllGroupsProvider extends ChangeNotifier {
  List userDetails = [];
  List<Group> userGroups = [];

  final newGroupNameController = TextEditingController();
  final editGroupName = TextEditingController();

  bool isLoading = false;
  bool userGroupLoading = false;
  bool msgLoading = false;

  bool newGroupLoading = false;

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
    notifyListeners();
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

  Future editGroupNameAndImg(
      context, groupId, groupName, imageUrl, fistImg) async {
    log("$groupId  $groupName $imageUrl ");
    await EditGroupProfileService.changeGroupInfo(
        context, groupId, groupName, imageUrl, fistImg);
    notifyListeners();
  }

  File? fileImg;
  Future<void> getImg() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      final photoTemp = File(photo.path);
      fileImg = photoTemp;
    }
    notifyListeners();
  }
}
