import 'dart:convert';
import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/functions.dart';
import 'package:nexonev/model/group_model.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;
import '../../controller/core/strings.dart';

class GetUserJoinedGroupService {
  static Future<List<Group>> getUserJoinedGroupStatus(context) async {
    final id = await getStoredData('Id');
    final token = await getStoredData('ACCESS_TOKEN');
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
          snackBarWidget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log("${respose.statusCode}");
        snackBarWidget(context: context, title: data['status'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }
}
