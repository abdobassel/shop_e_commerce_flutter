import 'package:flutter/material.dart';

class Shop_Home extends StatelessWidget {
  const Shop_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShopHome')),
      body: Center(
        child: TextButton(
          child: Text('logOut'),
          onPressed: () {},
        ),
      ),
    );
  }
}
