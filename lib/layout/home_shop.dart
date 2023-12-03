import 'package:flutter/material.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/login/login.dart';

class Shop_Home extends StatelessWidget {
  const Shop_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShopHome')),
      body: Center(
        child: TextButton(
          child: Text('logOut'),
          onPressed: () {
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
          },
        ),
      ),
    );
  }
}
