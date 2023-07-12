import 'dart:async';

import 'package:bookingapp/apiservice/group_service/group_msg_service.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/chatmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatProvider extends ChangeNotifier {
  bool isMsgLoading = false;
  TextEditingController textController = TextEditingController();
  late String groupId;
  IO.Socket? socket;
  final StreamController<List<ChatModel>> listMsg =
      StreamController<List<ChatModel>>.broadcast();
  ChatProvider() {
    connect();
  }
  void setGroupId({required groupId1}) {
    groupId = groupId1;
  }

  void connect() {
    socket = IO.io(Urls.baseUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    notifyListeners();
    socket!.connect();
    notifyListeners();
    socket!.onConnect((data) {
      // ignore: avoid_print
      print('connnected to frontend');
    });
    notifyListeners();
  }

  Future<void> getMessages(context) async {
    isMsgLoading = true;
    notifyListeners();
    await GroupMsgService.getMsgStatus(context, groupId).then((value) {
      if (value != null) {
        listMsg.add(value);
        isMsgLoading = false;
        notifyListeners();
      } else {
        isMsgLoading = false;
        notifyListeners();
      }
    });
  }

  void sendMsg({required String message, required String groupId}) {
    notifyListeners();
    notifyListeners();
    socket!.emit("message",
        {"name": getUsername(), "text": message, "groupId": groupId});
    textController.clear();
  }

  getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    return name.toString();
  }

  getUserEmail() async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString("USER_EMAIL");
    return email.toString();
  }
}
