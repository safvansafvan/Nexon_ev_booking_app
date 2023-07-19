import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/apiservice/map_service/get_charger_port.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/location/add_plot_model.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MapProvider extends ChangeNotifier {
  final stationNameCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final keyController = TextEditingController();
  List<dynamic>? mapDetails;
  MapProvider() {
    getUsername();
    getEmail();
  }
  Future fetchCharginLocation(context) async {
    mapDetails = await getChargingPort(context);
    notifyListeners();
  }

  ///add charging plot
  addButtonClick({context, required double lat, required double long}) async {
    final String url = Urls.baseUrl + Urls.map + Urls.addPlot;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: bodyData(lat: lat, long: long),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(response.body.toString());

        if (data['status'] == 'success') {
          log(response.body, name: "Success");
          snakBarWiget(context: context, title: "Added New Port", clr: kGreen);
          fetchCharginLocation(context);
        } else {
          final message = data['message'];
          log(message, name: "status not success");
          snakBarWiget(context: context, title: message, clr: kred);
        }
      } else {
        log("${response.statusCode}");
        final data = jsonDecode(response.body);
        final msg = data['message'];
        snakBarWiget(context: context, title: msg, clr: kred);
      }
    } catch (error) {
      log(error.toString());
    }
    notifyListeners();
  }

  String? userName;
  String? userEmail;

  Map<String, dynamic> bodyData({required double lat, required double long}) {
    final data = AddPlotModel(
      type: keyController.text.trim(),
      desc: descriptionCtr.text.trim(),
      title: stationNameCtr.text.trim(),
      email: userEmail,
      username: userName,
      long: long,
      lat: lat,
    );
    return data.toJson();
  }

  Future getEmail() async {
    final pref = await SharedPreferences.getInstance();
    userEmail = pref.getString("USER_EMAIL");
  }

  Future getUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString("USER_NAME");
  }
}
