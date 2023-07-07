// import 'dart:convert';
// import 'dart:developer';

// import 'package:bookingapp/controller/const/const.dart';
// import 'package:bookingapp/controller/const/string.dart';
// import 'package:bookingapp/presentation/widget/snack_bar.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class GetMsgServie {
//   static Future<void> fetchGroupMessages(String groupId) async {
//     try {
//       final response = await http.post(
//         Uri.parse('your_api_endpoint'),
//         body: {'groupId': groupId},
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//       final   messages = data['result'];
//         notifyListeners();
//       } else {
//         throw Exception('Failed to fetch group messages');
//       }
//     } catch (error) {
//       throw Exception('Failed to fetch group messages: $error');
//     }
//   }
// }
