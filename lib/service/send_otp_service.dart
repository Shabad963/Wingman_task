import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/config/urls.dart';
import 'package:wingman_task/model/send_otp_model.dart';

class SendOtpService {
  static Future<SendOtpModel?> sendOtpService({required String mobile,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    String? token = prefs.getString(Constants.authToken);
    Map data = {"mobile" : mobile};
    log('-ssssss---$data');
    try {
      http.Response response = await http.post(Uri.parse(Urls.sendOtp),
            headers: {
            // 'Authorization': 'Bearer $token',
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: data);
      if (response.statusCode == 200) {
        log(response.body);
        return SendOtpModel.fromJson(jsonDecode(response.body.toString()));
      } else {
        log(response.body);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}