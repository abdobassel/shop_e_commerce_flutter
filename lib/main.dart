import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/onBoaring/onboarding_screen.dart';
import 'package:shop_app/shared/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const Shop());
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoardingScreen(),
      theme: lightTheme,
    );
  }
}
