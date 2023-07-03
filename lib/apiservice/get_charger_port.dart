import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:http/http.dart' as http;

getChargingPort(ctx) async {
  log("get charging port called");
  final url = Urls.baseUrl + Urls.map + Urls.getMap;
  var maxRetrie = 3;
  var retrieDelay = const Duration(seconds: 2);
  for (var retrie = 0; retrie < maxRetrie; retrie++) {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData['result'];
      } else if (response.statusCode == 503) {
        log("Received 503 - Retrying...");
        await Future.delayed(retrieDelay);
      } else {
        log("failed");
        log("${response.statusCode}");
        snakBarWiget(
            context: ctx, title: "Charger location finding failed", clr: kred);
      }
    } catch (error) {
      log(error.toString());
      snakBarWiget(context: ctx, title: error.toString(), clr: kred);
    }
  }
}
