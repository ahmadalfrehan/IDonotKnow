import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/Login.dart';
import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';
import 'HelperTalents.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  var far = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var scaff = ScaffoldMessenger.of(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          scaff.showSnackBar(
            SnackBar(
              elevation: 0,
              backgroundColor: Colors.green,
              content: Center(
                child: Text(
                  state.success,
                ),
              ),
            ),
          );
        } else if (state is RegisterErrorState) {
          scaff.showSnackBar(
            SnackBar(
              elevation: 0,
              backgroundColor: Colors.red,
              content: const Center(
                child: Text("An error occurred try again !"),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        var r = RegisterCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state is RegisterLoadingState)
                        const SizedBox(height: 30),
                      if (state is RegisterLoadingState)
                        Center(child: LinearProgressIndicator()),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/Group_58.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: far,
                        child: Column(
                          children: [
                            textFormF('Full Name', r.nameController),
                            textFormF('Email Adress or Moblie number',
                                r.emailOrPhoneController),
                            textFormF('Password', r.passwordController),
                            textFormF('Gender', r.genderController),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromRGBO(234, 169, 0, 0.6),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('BACK'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(234, 169, 0, 1),
                              ),
                              onPressed: () {
                                if (far.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HelperTalents(),
                                    ),
                                  );
                                }
                              },
                              child: const Text('NEXT'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget textFormF(String label, var c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              6.0,
            ),
            borderSide: const BorderSide(
                color: Color.fromRGBO(210, 153, 5, 0.55), width: 1.3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              6.0,
            ),
            borderSide: const BorderSide(
                color: Color.fromRGBO(210, 153, 5, 0.55), width: 1.3),
          ),
          labelText: label,
        ),
        controller: c,
        keyboardType: TextInputType.text,
        validator: (String? value) {
          if (label == 'Full Name') {
            if (value!.isEmpty) {
              return 'the name must not be empty';
            }
            if (value.contains('_') || value.contains(' ')) {
              return 'the name Cannot be contains _ or space ';
            }
          }
          if (label == 'Email Adress or Moblie number') {
            if (value!.isEmpty) {
              return 'the email must not be empty';
            }
            if (!value.contains('@') || value.contains(' ')) {
              return 'the email must be contains @';
            }
            if (value.contains(' ')) {
              return 'the email Cannot be contains space';
            }
          }
          if (label == 'Password') {
            if (value!.isEmpty) {
              return 'the password must not be empty';
            }
            if (!value.contains('@') || !value.contains('.')) {
              return 'the Password must be contains @ and .';
            }
            if (!validateStructure(value)) {
              return 'must be contains numbers and UPPer case and lower case letters';
            }
          }
          if (label == 'Gender') {
            if (value!.isEmpty) {
              return 'the gender must not be empty';
            }
          }
          return null;
        },
      ),
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
