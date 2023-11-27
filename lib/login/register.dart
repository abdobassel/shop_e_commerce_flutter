import 'package:flutter/material.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/login/login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var mailcontroller = TextEditingController();

  var pwcontroller = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool passwordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaultTextForm(
                          controller: mailcontroller,
                          labeltext: "email",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email can not be empty';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          prefix: Icons.email),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultTextForm(
                          showPassfunc: () {
                            setState(() {
                              passwordShow = !passwordShow;
                            });
                          },
                          isPassword: passwordShow,
                          suffixIcon: passwordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: pwcontroller,
                          labeltext: "password",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password empty!!';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock),
                      DefaultTextForm(
                          showPassfunc: () {
                            setState(() {
                              passwordShow = !passwordShow;
                            });
                          },
                          isPassword: passwordShow,
                          suffixIcon: passwordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: pwcontroller,
                          labeltext: "Confirm Password ",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password empty!!';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock),
                      DefaultTextForm(
                          showPassfunc: () {
                            setState(() {
                              passwordShow = !passwordShow;
                            });
                          },
                          isPassword: passwordShow,
                          suffixIcon: passwordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: pwcontroller,
                          labeltext: "password",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password empty!!';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(pwcontroller.text);
                          print(mailcontroller.text);
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("you have an account?"),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }), (route) => true);
                            },
                            child: Text("Login Now")),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
