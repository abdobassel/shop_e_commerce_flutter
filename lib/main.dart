import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/layout/home_shop.dart';
import 'package:shop_app/login/login.dart';
import 'package:shop_app/onBoaring/onboarding_screen.dart';
import 'package:shop_app/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await cacheHelper.init();
  bool onBoarding = cacheHelper.getData(key: 'onBoarding') ?? false;

  String token = cacheHelper.getData(key: 'token') ?? false;
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = Shop_Home();
    } else {
      widget = Login();
    }
  } else {
    widget = onBoardingScreen();
  }

  print(onBoarding);
  print(token);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
      theme: lightTheme,
    );
  }
}
