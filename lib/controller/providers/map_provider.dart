import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapProvider extends ChangeNotifier {
  getChargingProt() async {
    final url = Urls.baseUrl + Urls.map + Urls.getMap;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData['result'];
      } else {
        log("failed");
        throw Exception('Failed to fetch map details');
      }
    } catch (error) {
      log(error.toString());
      throw Exception('Failed to connect to the backend: $error');
    }
  }
}
