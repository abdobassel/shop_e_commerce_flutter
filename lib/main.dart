import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/layout/home_shop.dart';
import 'package:shop_app/login/login.dart';

import 'package:shop_app/onBoaring/onboarding_screen.dart';
import 'package:shop_app/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await cacheHelper.init();
  bool onBoarding = cacheHelper.getData(key: 'onBoarding');

  token = cacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding) {
    if (token != null) {
      widget = const Shop_Home();
    } else {
      widget = Login();
    }
  } else {
    widget = onBoardingScreen();
  }

  //print(onBoarding);
  // print(token);
  DioHelper.init();
// runApp(Shop(onBoarding: onBoarding));
  runApp(Shop(startWidget: widget));
}

class Shop extends StatelessWidget {
  // final bool? onBoarding;
  final Widget startWidget;
  const Shop({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubit(ShopInitializeState())
              ..getData()
              ..getCategoriesData()
              ..getFavoritesData()
              ..getUserProfile()),
        //  BlocProvider(
        //  create: (context) => RegisterCubit(RegisteritState())..re),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
        theme: lightTheme,
      ),
    );
  }
}
