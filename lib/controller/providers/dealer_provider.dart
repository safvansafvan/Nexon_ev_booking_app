import 'package:bookingapp/apiservice/dealer_service.dart';
import 'package:bookingapp/model/dealer/dealer_model.dart';
import 'package:flutter/material.dart';

class DealerProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Dealer> dealerList = [];
  Future getDealer() async {
    isLoading = true;
    notifyListeners();
    dealerList = await DealerService.fetchDealerStatus();
    isLoading = false;
    notifyListeners();
  }
}
