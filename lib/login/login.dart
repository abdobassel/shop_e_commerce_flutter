import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/layout/home_shop.dart';
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
        child:
            BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
          if (state is LoginSuccesState) {
            if (state.shopLoginModel!.status!) {
              print(state.shopLoginModel?.data!.token);

              print(state.shopLoginModel?.msg);
              cacheHelper
                  .saveData(
                      key: 'token', value: state.shopLoginModel?.data!.token)
                  ?.then((value) {
                token = state.shopLoginModel?.data!.token;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Shop_Home(),
                    ),
                    (route) => false);
              });
            } else {
              print(state.shopLoginModel?.msg);
              Fluttertoast.showToast(
                  msg: '${state.shopLoginModel?.msg}',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP_RIGHT,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        }, builder: (context, state) {
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
                                  if (value != null) {
                                    if (value!.isEmpty) {
                                      return 'Email can not be empty';
                                    }
                                    return null;
                                  }
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
                                  if (value != null) {
                                    if (value!.isEmpty) {
                                      return 'Password Is Too Short';
                                    }
                                    return null;
                                  }
                                },
                                onSubmit: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.postLogin(
                                        email: emailcontroller.text,
                                        password: pwcontroller.text);
                                  }
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
                        child: Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! LoginLoadingState,
                          widgetBuilder: (context) => DefaultButton(
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.postLogin(
                                    email: emailcontroller.text,
                                    password: pwcontroller.text);
                              }
                            },
                            text: 'login',
                            isUperCase: true,
                            radius: 15,
                          ),
                          fallbackBuilder: (context) => Center(
                            child: CircularProgressIndicator(),
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
                                        MaterialPageRoute(builder: (context) {
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
