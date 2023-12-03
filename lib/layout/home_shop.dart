import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/layout/search/searchscreen.dart';
import 'package:shop_app/login/login.dart';

class Shop_Home extends StatelessWidget {
  const Shop_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubitshop = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                icon: Icon(Icons.search))
          ], title: Text('Bassel')),
          body: cubitshop.screensShop[cubitshop.IndexShopScreens],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubitshop.changeScreenShop(index);
              },
              currentIndex: cubitshop.IndexShopScreens,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Products'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.apps,
                    ),
                    label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favourites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings')
              ]),
        );
      },
    );
  }
}
