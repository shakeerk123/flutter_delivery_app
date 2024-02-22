import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_delivery_app/utils/constants/api_url.dart';

class ApiServices {
  Dio dio = Dio();




/////////////// SIGNUP  ////////////////////////////

  Future<bool> signUpModel(String name, String email, String password,String mobile) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "mobile":mobile,
    };

    try {
      final response = await dio.post(
       signUpUrl,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      log(response.statusCode.toString());
      print(response.statusCode);

      if (response.statusCode == 401) {
        String error = 'Something went wrong';
        if (response.data != null &&
            response.data['error'] == 'Invalid username or password') {
          error = 'Invalid username or password';
        }
        throw Exception(error);
      }
      return response.statusCode == 200;
    } on DioException {
      rethrow;
    }
  }
}