import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/utils/constants.dart';

import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(UserModel user) async {
    emit(RegisterLoading());
    try {
      http.Client client = http.Client();
      const url = '$baseUrl/auth/register';
      final response = await client.post(Uri.parse(url), body: user.toJson());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        emit(RegisterSuccess());
      }
    } catch (e) {
      log('error = ${e.toString()}');
      emit(RegisterFailure(errmessage: 'An error occurred ${e.toString()}.'));
    }
  }
}
