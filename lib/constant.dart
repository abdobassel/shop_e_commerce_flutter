// base_url = https://newsapi.org/
// method  = v2/top-headlines?
// query = country=us&apiKey=8a80ccfb232846e3abd78a75a59c4eb6
// category 'business,sports,general'
//  https://newsapi.org/v2/top-headlines?country=us&apiKey=8a80ccfb232846e3abd78a75a59c4eb6&category=business

// Color(0xff#313737)

import 'package:flutter/material.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/login/login.dart';

void SignOut(context) {
  cacheHelper.removeData(key: 'token').then((value) {
    if (value != null) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
      }
    }
  });
}
