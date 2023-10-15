import 'dart:convert';
import 'dart:developer';

import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/model/dealer/dealer_model.dart';
import 'package:http/http.dart' as http;

class DealerService {
  static Future fetchDealerStatus() async {
    final String url = Urls.baseUrl + Urls.dealer;
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final dealerList = List<Dealer>.from(
          data['result'].map((dealer) =>
              Dealer(dealerName: dealer['dealerName'], city: dealer['city'])),
        );
        return dealerList;
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      log('Error occurred: $error');
    }
  }
}
