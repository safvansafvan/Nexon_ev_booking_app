import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/presentation/screens/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
// ignore: depend_on_referenced_packages
import 'package:mime/mime.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/core/strings.dart';

class EditGroupProfileService {
  static Future changeGroupInfo(
      context, groupId, groupName, File? imageFile, fistImg) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('ACCESS_TOKEN');
    final url = Urls.baseUrl + Urls.group + Urls.upgradeGroup;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['x-access-token'] = token.toString();
      request.fields['id'] = groupId;
      request.fields['groupName'] = groupName;

      final imagePath = imageFile?.path ?? fistImg;
      final mimeTypeData = lookupMimeType(imagePath)!.split('/');
      final file = await http.MultipartFile.fromPath(
        'img',
        imagePath,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      request.files.add(file);

      final response = await request.send();
      final data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        log("${response.statusCode}");
        final jsonData = jsonDecode(data);
        if (jsonData['status'] == 'success') {
          snakBarWiget(context: context, title: "Profile Changed", clr: kGreen);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        } else {
          log(jsonData['message']);
          snakBarWiget(context: context, title: jsonData['message'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        final jsonData = jsonDecode(data);
        snakBarWiget(context: context, title: jsonData['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
