import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/Login.dart';
import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';
import 'HelperTalents.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  var nameController = TextEditingController();

  var emailOrPhoneController = TextEditingController();

  var genderController = TextEditingController();

  var passwordController = TextEditingController();
  var far = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var scaff = ScaffoldMessenger.of(context);
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            scaff.showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          state.success,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is RegisterErrorState) {
            scaff.showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text("An error occurred try again !"),
                      ),
                    ),
                  ],
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
                              textFormF('Full Name', nameController),
                              textFormF('Email Adress or Moblie number',
                                  emailOrPhoneController),
                              textFormF('Password', passwordController),
                              textFormF('Gender', genderController),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'What talents do you have ?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 25),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Maximum of 3 talents can be selected',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        HelperTalents(),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () {
                              r.fill();
                              if (r.talents.length > 3) {
                                scaff.showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('please select only three talents'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (far.currentState!.validate()) {
                                r.userRegister(
                                    name: nameController.text,
                                    email: emailOrPhoneController.text,
                                    password: passwordController.text,
                                    gender: genderController.text,
                                    talents: r.talents);
                              }
                            },
                            minWidth: double.infinity,
                            color: const Color.fromRGBO(210, 153, 5, 1),
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height > 800 ? 10 : 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already a member?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  Login(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: Color(0xFFEAA900),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
          if (value!.isEmpty) {
            return 'the name must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
