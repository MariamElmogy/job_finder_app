import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:job_finder_app/utils/constants.dart';

import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(UserModel user) async {
    emit(RegisterLoading());
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);
      const url = '$baseUrl/auth/register';
      final response = await client.post(
        Uri.parse(url),
        body: {
          'name': user.name,
          'password': user.password,
          'email': user.email,
        },
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (response.statusCode == 200) {
        json.decode(response.body);

        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errmessage: 'Registration failed.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      log('error = ${e.toString()}');
      emit(RegisterFailure(errmessage: 'An error occurred ${e.toString()}.'));
    }
  }
}
