import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/layout/categories/categories.dart';
import 'package:shop_app/layout/favourite/favourites.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/layout/settings/settings.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(super.initialState);

  static ShopCubit get(context) => BlocProvider.of(context);

  int IndexShopScreens = 0;

  List<Widget> screensShop = [
    ProductsScreen(),
    FavouriteScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];
  void changeScreenShop(int index) {
    IndexShopScreens = index;
    emit(ShopChangeBottomNavState());
  }
}
