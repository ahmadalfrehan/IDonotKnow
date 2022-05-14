import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Dio? dio;

  init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://gold-golio.herokuapp.com/',
      ),
    );
  }

  userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    init();
    final headers = {
      "content-type": "application/json",
    };
    print(password);
    final data = {
      "email": email,
      "password": password,
    };
    await http
        .post(
      Uri.parse('https://gold-golio.herokuapp.com/signin'),
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers,
    )
        .then((value) {
      debugPrint(value.toString());
      debugPrint(value.body.toString());
      debugPrint(value.statusCode.toString());
      //debugPrint(value.data['message'].toString());
      //debugPrint(value.statusMessage);
      emit(LoginSuccessState(value.body.toString()));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
      debugPrint(onError.toString());
    });
    /*if (response.statusCode == 200) {
        print('done');
        print(response.statusCode);
        return true;
      } else {
        print('error');
        print(response.statusCode);
        print(response.body);
        return false;
      }*/
    /*await dio
        ?.post(
      'talented_reg',
      data: data,
      options: Options(
        headers: headers,
      ),
    )
        .then((value) {
      debugPrint(value.toString());
      debugPrint(value.data['message'].toString());
      debugPrint(value.statusMessage);
      emit(LoginSuccessState(value.data['message']));
    }).catchError((onError) {
    });*/
  }
 bool a2 = false;
  chageBool(bool a1, bool b) {
    a1 = b;
    emit(LoginChangePasswordVisibilityState());
    return a1;
  }
}
