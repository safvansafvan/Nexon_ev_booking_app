import 'dart:convert';
import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/model/location/map_model.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;

class MapService {
  static Future<List<MapDataModel>> getChargingPort(ctx) async {
    log("get charging port called");
    final url = Urls.baseUrl + Urls.map + Urls.getMap;
    var maxRetrie = 3;
    var retrieDelay = const Duration(seconds: 2);
    for (var retrie = 0; retrie < maxRetrie; retrie++) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          List<MapDataModel> mapData = (data['result'] as List)
              .map((e) => MapDataModel.fromJson(e))
              .toList();
          return mapData;
        } else if (response.statusCode == 503) {
          log("Received 503 - Retrying...");
          await Future.delayed(retrieDelay);
        } else {
          log("failed");
          log("${response.statusCode}");
          snackBarWidget(
              context: ctx,
              title: "Charger location finding failed",
              clr: kred);
        }
      } catch (error) {
        log(error.toString());
      }
    }
    return [];
  }
}
