import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/config/urls.dart';
import 'package:wingman_task/model/details_model.dart';

class DetailsService {
  static Future<DetailsModel?> detailsService({
    required String name,
    required String email,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(Constants.authToken);
    Map data = {"name": name, "email": email};
    log('-ssssss---$data');
    try {
      http.Response response = await http.post(Uri.parse(Urls.submitDetails),
          body: json.encode(data),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
        log(response.body);
        return DetailsModel.fromJson(jsonDecode(response.body.toString()));
      } else {
        toaster("Some error occured,try again later");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
