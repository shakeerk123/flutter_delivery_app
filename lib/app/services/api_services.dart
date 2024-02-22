import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/utils/colors.dart';
import 'package:flutter_delivery_app/utils/constants/api_url.dart';
import 'package:flutter_delivery_app/utils/constants/error_handling.dart';

class ApiServices {
  Dio dio = Dio();

/////////////// SIGNUP  ////////////////////////////

  Future<bool> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String mobile,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
    };

    try {
      final response = await dio.post(
        signUpUrl,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // ignore: use_build_context_synchronously
      handleApiError(
        response: response,
        context: context,
        onSuccess: () {
          showSuccessSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );

      log(response.statusCode.toString());
      print(response.statusCode);

      return response.statusCode == 200;
    }on DioException  {
      rethrow;
    }
  }

  // Future<bool> signUpModel(String name, String email, String password,
  //     String mobile, BuildContext context) async {
  //   var data = {
  //     "name": name,
  //     "email": email,
  //     "password": password,
  //     "mobile": mobile,
  //   };

  //   try {
  //     final response = await dio.post(
  //       signUpUrl,
  //       data: jsonEncode(data),
  //       options: Options(
  //         headers: {'Content-Type': 'application/json'},
  //       ),
  //     );

  //     // ignore: use_build_context_synchronously
  //     handleApiError(onSuccess: () {}, context: context, response: response);

  //     log(response.statusCode.toString());
  //     print(response.statusCode);

  //     return response.statusCode == 200;
  //   } on DioException {
  //     rethrow;
  //   }
  // }
}
