import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/login/login.dart';
import 'package:shop_app/onBoaring/onboarding_screen.dart';
import 'package:shop_app/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await cacheHelper.init();
  bool onBoarding = cacheHelper.getData(key: 'onBoarding') ?? false;
  print(onBoarding);
  DioHelper.init();

  runApp(Shop(onBoarding: onBoarding));
}

class Shop extends StatelessWidget {
  final bool? onBoarding;
  const Shop({super.key, this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoarding! ? Login() : onBoardingScreen(),
      theme: lightTheme,
    );
  }
}
