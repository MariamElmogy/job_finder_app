import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);
      final response = await client.post(Uri.parse('$baseUrl/auth/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        log('data in the cubit login ${data.toString()}');
        log(data['token']);
        sharedPreferences.setString(kUserToken, data['token']);

        emit(LoginSuccess());
      } else {
        log('failed');
        LoginFailure(errMessage: "failed");
      }
    } catch (e) {
      log('an error in login cubit ${e.toString()}');
      LoginFailure(errMessage: e.toString());
    }
  }
}
