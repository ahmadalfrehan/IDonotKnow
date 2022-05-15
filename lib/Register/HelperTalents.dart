import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/Login.dart';
import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';

class HelperTalents extends StatelessWidget {
  HelperTalents({Key? key}) : super(key: key);

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
              content: Center(
                child: Text("An error occurred try again !"
                    "${state.error}"),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
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
                    //HelperTalents(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString1,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent1,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent1 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent1, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent2,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent2 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent2, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString3,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent3,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent3 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent3, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString4,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent4,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent4 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent4, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString5,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent5,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent5 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent5, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString6,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent6,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent6 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent6, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString7,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent7,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent7 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent7, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString8,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent8,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent8 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent8, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString9,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent9,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent9 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent9, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString10,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent10,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent10 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent10, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString11,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent11,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent11 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent11, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString12,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent12,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent12 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent12, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString13,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent13,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent13 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent13, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString14,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent14,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent14 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent14, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString15,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent15,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent15 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent15, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString16,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent16,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent16 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent16, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString17,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent17,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent17 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent17, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString18,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent18,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent18 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent18, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString19,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: r.talent19,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent19 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent19, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: CheckboxListTile(
                            title: Text(
                              r.talentString20,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: r.talent20,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).talent20 =
                                  RegisterCubit.get(context)
                                      .changeBool(r.talent20, newValue!);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
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
                          }
                          if (r.talents.length <= 3) {
                            print(r.nameController.text);
                            r.userRegister(
                              name: r.nameController.text,
                              email: r.emailOrPhoneController.text,
                              password: r.passwordController.text,
                              gender: r.genderController.text,
                              talents: r.talents,
                            );
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
                                builder: (context) => Login(),
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
        );
      },
    );
  }
}
