import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  var emailOrPhoneController = TextEditingController();

  var passwordController = TextEditingController();
  var far = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.width.toString());

    var scaff = ScaffoldMessenger.of(context);
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
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
          } else if (state is LoginErrorState) {
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
          var r = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: const Color(0XFFFFFFFF),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state is LoginLoadingState)
                          const SizedBox(height: 30),
                        if (state is LoginLoadingState)
                          Center(child: LinearProgressIndicator()),
                        Image.asset('assets/Group_58.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        const Text(
                          'Let’s Share your talent with the world ',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height > 800 ? 80 : 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    !r.a2
                                        ? r.a2 = r.chageBool(r.a2, true)
                                        : r.a2 = r.chageBool(r.a2, false);
                                  },
                                  child: const Text(
                                    'Sign up with Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.black,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height > 800 ? 30 : 10,
                        ),
                        if (r.a2)
                          Form(
                            key: far,
                            child: Column(
                              children: [
                                textFormF('Email Adress or Moblie number',
                                    emailOrPhoneController),
                                textFormF('Password', passwordController),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (far.currentState!.validate()) {
                                        r.userLogin(
                                          email: emailOrPhoneController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    minWidth: double.infinity,
                                    color: const Color.fromRGBO(210, 153, 5, 1),
                                    child: const Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.5),
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                'OR',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 2),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width / 2.6,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Image.asset('assets/search1.png',
                                          scale: 1.5),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sign up with Google',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      399
                                                  ? 8
                                                  : 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width < 350
                                    ? 10
                                    : 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.facebook),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sign up with Facebook',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      399
                                                  ? 8
                                                  : 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height > 800 ? 30 : 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don’t have an account?'),
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color(0xFFEAA900),
                                ),
                              ),
                            )
                          ],
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
