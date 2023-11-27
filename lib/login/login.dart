import 'package:flutter/material.dart';
import 'package:shop_app/components.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mailcontroller = TextEditingController();

  var pwcontroller = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool passwordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
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
                    'LogIn',
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
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultButton(
                  radius: 30,
                  function: () {
                    print('object');
                  },
                  isUperCase: true,
                  text: 'logout',
                  width: 200,
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don\'t have account?"),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("Rigester Now")),
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
