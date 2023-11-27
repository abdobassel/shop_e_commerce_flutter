import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/login/bloc/cubit_login.dart';
import 'package:shop_app/login/bloc/states_login.dart';
import 'package:shop_app/login/register.dart';

class Login extends StatelessWidget {
  var emailcontroller = TextEditingController();

  var pwcontroller = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool passwordShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(LoginitState()),
        child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
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
                              'LogIn',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
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
                                    controller: emailcontroller,
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
                                      cubit.changeShowPassword();
                                    },
                                    isPassword: cubit.ispassword,
                                    suffixIcon: cubit.ispassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    controller: pwcontroller,
                                    labeltext: "Password",
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password Is Too Short';
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
                                  cubit.changeShowPassword();
                                  if (_formKey.currentState!.validate()) {
                                    cubit.postLogin(emailcontroller.text,
                                        pwcontroller.text);
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
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don\'t have account?"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Register();
                                        }), (route) => true);
                                      },
                                      child: Text("Rigester Now")),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
