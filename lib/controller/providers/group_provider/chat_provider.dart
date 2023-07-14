import 'dart:async';
import 'dart:developer';
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
    socket!.connect();
    socket!.onConnect((data) {
      // ignore: avoid_print
      log('connnected to frontend');
    });
    notifyListeners();
  }

  Future<void> getMessages(context) async {
    isMsgLoading = true;
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

  void sendMsg({required String message, required String groupId}) async {
    final userName = await getUsername();
    log(userName.toString(), name: "sendMSg");
    socket!.emit(
        "messages", {"name": userName, "text": message, "groupId": groupId});
    textController.clear();
    notifyListeners();
  }

  Future<String> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    log(name.toString());
    return name.toString();
  }
}
