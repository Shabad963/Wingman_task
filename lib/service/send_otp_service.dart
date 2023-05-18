import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:wingman_task/config/urls.dart';
import 'package:wingman_task/model/send_otp_model.dart';

class SendOtpService {
  static Future<SendOtpModel?> sendOtpService({
    required String mobile,
  }) async {
    Map data = {"mobile": mobile};
    log('-ssssss---$data');
    try {
      http.Response response = await http
          .post(Uri.parse(Urls.sendOtp),   body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
      if (response.statusCode == 200) {
        log(response.body);
        return SendOtpModel.fromJson(jsonDecode(response.body.toString()));
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
