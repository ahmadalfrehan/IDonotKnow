import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Getting_Started.dart';
import 'Login/Login.dart';
import 'Register/Cubit/Cubit.dart';
import 'Register/Cubit/States.dart';
import 'Register/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Getting_Started(),
          );
        },
      ),
    );
  }
}
