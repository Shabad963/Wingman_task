import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wingman_task/common/common_widgets.dart';

import 'package:wingman_task/config/urls.dart';
import 'package:wingman_task/model/verify_otp_model.dart';

class VerifyOtpService {
  static Future<VerifyOtpModel?> verifyOtpService({
    required String requestId,
    required String code,
  }) async {
    Map data = {"request_id": requestId, "code": code};
    log('-ssssss---$data');
    try {
      http.Response response = await http
          .post(Uri.parse(Urls.verifyOtp), body: json.encode(data), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        log(response.body);
        return VerifyOtpModel.fromJson(jsonDecode(response.body.toString()));
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
