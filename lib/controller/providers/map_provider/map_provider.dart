import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/apiservice/map_service/get_charger_port.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/model/location/add_plot_model.dart';
import 'package:bookingapp/model/location/map_model.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MapProvider extends ChangeNotifier {
  final stationNameCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final keyController = TextEditingController();
  List<MapDataModel> mapDetails = [];
  MapProvider() {
    getUsername();
    getEmail();
  }
  Future fetchCharginLocation(context) async {
    mapDetails = await MapService.getChargingPort(context);
    notifyListeners();
  }

  ///add charging plot
  addButtonClick({context, required double lat, required double long}) async {
    final String url = Urls.baseUrl + Urls.map + Urls.addPlot;
    var data = bodyData(lat: lat, long: long);
    log(data.toString());
    try {
      final response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          snackBarWidget(
              context: context, title: "Added New Port", clr: kGreen);
        } else {
          final message = data['message'];
          snackBarWidget(context: context, title: message, clr: kred);
        }
      } else {
        final data = jsonDecode(response.body);
        final msg = data['message'];
        snackBarWidget(context: context, title: msg, clr: kred);
      }
    } catch (error) {
      log(error.toString(), name: "fe");
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
      email: "a@gmail.com",
      username: "aboobacker siddeeq",
      long: 75.88910732695314,
      lat: 11.159977702366284,
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
