import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
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

      if (response.statusCode == 200) {
        json.decode(response.body);

        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errmessage: 'Registration failed.'));
      }
    } catch (e) {
      log('error = ${e.toString()}');
      emit(RegisterFailure(errmessage: 'An error occurred ${e.toString()}.'));
    }
  }
}




  // Future<void> register(
  //     {required UserModel userModel, required String password}) async {
  //   emit(RegisterLoading());
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: userModel.email!,
  //       password: password,
  //     );
  //     log('credential');
  //     await storeUserData(credential, userModel);
  //     log('Data is stored');
  //     log(userModel.toJson().toString());
  //     emit(RegisterSuccess());
  //     log('Success');
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       emit(RegisterFailure(errmessage: 'The password provided is too weak.'));
  //     } else if (e.code == 'email-already-in-use') {
  //       emit(RegisterFailure(
  //           errmessage: 'The account already exists for that email.'));
  //     } else {
  //       log('error : ${e.code}');
  //     }
  //   } catch (e) {
  //     // print(e);
  //     emit(RegisterFailure(errmessage: 'something went wrong'));
  //   }
  // }