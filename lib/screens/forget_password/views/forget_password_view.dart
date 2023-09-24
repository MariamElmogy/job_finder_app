import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:job_finder_app/screens/forget_password/widgets/forget_password_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_images.dart';
import '../../../utils/constants.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(AppImages.kAppBarLogo),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0), child: ForgetPasswordViewBody()),
      ),
    );
  }
}

Future<void> getOtp({required String email}) async {
  try {
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);

    const url = '$baseUrl/auth/otp';
    final response = await client.post(
      Uri.parse(url),
      body: {
        // 'password': user.password,
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      json.decode(response.body);
      log(jsonEncode(json.decode(response.body)));
    }
  } catch (e) {
    log('error = ${e.toString()}');
  }
}
