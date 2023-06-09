import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../controller/const/string.dart';

class GetUserJoinedGroupService {
  static Future<List<Group>> getUserJoinedGroupStatus(context) async {
    final pref = await SharedPreferences.getInstance();
    final id = pref.getString('Id');
    final token = pref.getString('ACCESS_TOKEN');
    Map<String, dynamic> body = {"id": id};
    log(id.toString());
    log(token.toString());
    final url = Urls.baseUrl + Urls.group + Urls.getUserGroup;
    final respose = await http.post(Uri.parse(url),
        body: body, headers: {'x-access-token': token.toString()});
    final data = jsonDecode(respose.body);
    try {
      if (respose.statusCode == 200) {
        log("${respose.statusCode}");
        if (data['status'] == 'success') {
          final List<Group> userGroupDetails =
              (data['result'] as List).map((e) => Group.fromJson(e)).toList();
          log("success");
          return userGroupDetails;
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log("${respose.statusCode}");
        snakBarWiget(context: context, title: data['status'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }
}
