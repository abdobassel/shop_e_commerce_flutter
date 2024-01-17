import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/components.dart';

class SettingsScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();

  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopCubit.get(context).userProfileModel;

          namecontroller.text = model!.data!.name!;
          emailcontroller.text = model.data!.email!;
          phonecontroller.text = model.data!.phone!;

          return Conditional.single(
            context: context,
            fallbackBuilder: (context) => CircularProgressIndicator(),
            conditionBuilder: (context) =>
                ShopCubit.get(context).userProfileModel != null,
            widgetBuilder: (context) => Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(children: [
                  if (state is ShopUpdateProfileLoadingState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultTextForm(
                      controller: namecontroller,
                      labeltext: "User Name",
                      validate: (value) {
                        if (value != null) {
                          if (value!.isEmpty) {
                            return 'username can not be empty';
                          }
                          return null;
                        }
                      },
                      type: TextInputType.name,
                      prefix: Icons.person),
                  SizedBox(
                    height: 20,
                  ),
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
                      controller: phonecontroller,
                      labeltext: "Phone",
                      validate: (value) {
                        if (value != null) {
                          if (value!.isEmpty) {
                            return 'Phone can not be empty';
                          }
                          return null;
                        }
                      },
                      type: TextInputType.phone,
                      prefix: Icons.phone),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                      text: 'Update',
                      function: () {
                        if (formkey.currentState!.validate()) {
                          ShopCubit.get(context).updateProfile(
                              name: namecontroller.text,
                              phone: phonecontroller.text,
                              email: emailcontroller.text);
                        }
                      },
                      radius: 30.0)
                ]),
              ),
            ),
          );
        });
  }
}

/*

 Conditional.single(

;
*/
