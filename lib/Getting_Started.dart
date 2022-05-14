import 'package:check_gradle/Login/Login.dart';
import 'package:check_gradle/Register/Register.dart';
import 'package:flutter/material.dart';

class Getting_Started extends StatefulWidget {
  const Getting_Started({Key? key}) : super(key: key);

  @override
  State<Getting_Started> createState() => _Getting_StartedState();
}

class _Getting_StartedState extends State<Getting_Started> {
  var t = false;
  var t2 = false;

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Container(
        color: const Color(0XFFFFFFFF),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Group_58.png'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome!',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                const SizedBox(
                  height: 29,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You’re in the right place',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'JOIN US',
                        style: TextStyle(
                            color: Color(0xFFEAA900),
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 800 ? 15 : 8,
                ),
                const Text(
                  'Join as',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 800 ? 15 : 8,
                ),
                /**/
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CheckboxListTile(
                            title: const Text(
                              "Talent",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: t2,
                            activeColor: const Color.fromRGBO(234, 169, 0, 1),
                            onChanged: (newValue) {
                              setState(() {
                                t2 = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              CheckboxListTile(
                                title: const Text(
                                  "Employer",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                value: t,
                                activeColor:
                                    const Color.fromRGBO(234, 169, 0, 1),
                                onChanged: (newValue) {
                                  setState(() {
                                    t = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                              if (t)
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 180,
                                        child: CheckboxListTile(
                                          title: const Text(
                                            'Individual',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          value: false,
                                          activeColor: const Color.fromRGBO(
                                              234, 169, 0, 1),
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 180,
                                        child: CheckboxListTile(
                                          title: Row(
                                            children: const [
                                              Expanded(
                                                child: Text(
                                                  'Corporate',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          value: false,
                                          activeColor: const Color.fromRGBO(
                                              234, 169, 0, 1),
                                          onChanged: (newValue) {
                                            setState(() {});
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(234, 169, 0, 0.6),
                        ),
                        onPressed: () {},
                        child: const Text('BACK'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(234, 169, 0, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child: const Text('NEXT'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 800 ? 30 : 10,
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 800 ? 30 : 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
