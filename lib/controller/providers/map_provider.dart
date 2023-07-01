import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapProvider extends ChangeNotifier {
  getChargingProt(ctx) async {
    final url = Urls.baseUrl + Urls.map + Urls.getMap;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData['result'];
      } else {
        log("failed");
        snakBarWiget(context: ctx, title: "Wrong", clr: kred);
      }
    } catch (error) {
      log(error.toString());
      snakBarWiget(context: ctx, title: error.toString(), clr: kred);
    }
    notifyListeners();
  }
}
