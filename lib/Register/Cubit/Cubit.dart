import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'States.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Dio? dio;

  init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://gold-golio.herokuapp.com/',
      ),
    );
  }

  userRegister({
    required String name,
    required String email,
    required String password,
    required String gender,
    required List<String> talents,
  }) async {
    emit(RegisterLoadingState());
    init();
    final headers = {
      "content-type": "application/json",
    };
    print(password);
    final data = {
      "full_name": name,
      "email": email,
      "password": password,
      "gender": gender,
      "talents": talents,
    };
    await http.post(
      Uri.parse('https://gold-golio.herokuapp.com/talented_reg'),
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
      emit(RegisterSuccessState(value.body.toString()));
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
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
      emit(RegisterSuccessState(value.data['message']));
    }).catchError((onError) {
    });*/
  }

  List<String> talents = [];

  fill() {
    talents.clear();
//    if (talents.length > 3) talents = [];
    if (talent1 == true) talents.add(talentString1);
    if (talent2 == true) talents.add(talentString2);
    if (talent3 == true) talents.add(talentString3);
    if (talent4 == true) talents.add(talentString4);
    if (talent5 == true) talents.add(talentString5);
    if (talent6 == true) talents.add(talentString6);
    if (talent7 == true) talents.add(talentString7);
    if (talent8 == true) talents.add(talentString8);
    if (talent9 == true) talents.add(talentString9);
    if (talent10 == true) talents.add(talentString10);
    if (talent11 == true) talents.add(talentString11);
    if (talent12 == true) talents.add(talentString12);
    if (talent13 == true) talents.add(talentString13);
    if (talent14 == true) talents.add(talentString14);
    if (talent15 == true) talents.add(talentString15);
    if (talent16 == true) talents.add(talentString16);
    if (talent17 == true) talents.add(talentString17);
    if (talent18 == true) talents.add(talentString18);
    if (talent19 == true) talents.add(talentString19);
    if (talent20 == true) talents.add(talentString20);

    debugPrint(talents.toString());
  }

  bool talent1 = false,
      talent2 = false,
      talent3 = false,
      talent4 = false,
      talent5 = false,
      talent6 = false,
      talent7 = false,
      talent8 = false,
      talent9 = false,
      talent10 = false,
      talent11 = false,
      talent12 = false,
      talent13 = false,
      talent14 = false,
      talent15 = false,
      talent16 = false,
      talent17 = false,
      talent18 = false,
      talent19 = false,
      talent20 = false;
  String talentString1 = 'Actor',
      talentString2 = 'Director',
      talentString3 = 'Photographer',
      talentString4 = 'Videographer',
      talentString5 = 'Graphic Designer',
      talentString6 = 'Editor',
      talentString7 = 'Art Director',
      talentString8 = 'Singer',
      talentString9 = 'Stylist & Fashion',
      talentString10 = 'Colorist',
      talentString11 = 'Makeup Artist',
      talentString12 = 'Sound Engineer',
      talentString13 = 'Journalist',
      talentString14 = 'Writer',
      talentString15 = 'Football Player',
      talentString16 = 'Production Manager',
      talentString17 = 'Model',
      talentString18 = 'Voice Over',
      talentString19 = 'Producer',
      talentString20 = 'Other';

  changeBool(bool l1, bool l2) {
    l1 = l2;
    emit(RegisterChangePasswordVisibilityState());
    return l1;
  }
}
