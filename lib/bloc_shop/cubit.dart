import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/layout/categories/categories.dart';
import 'package:shop_app/layout/favourite/favourites.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/layout/settings/settings.dart';
import 'package:shop_app/models/categoriesModels/cat_model.dart';
import 'package:shop_app/models/shopHomeModel/shop_home_model.dart';

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

  // data of home  shop
  HomeModel? homeModel;
  void getData() {
    emit(ShopLoadingState());
    DioHelper.getData(url: Home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data?.proudcts[0].img);
      print(homeModel?.data?.banners.length);

      emit(ShopSuccesDataHomeState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorDataHomeState(error: '${error.toString()}'));
    });
  }

// get Categories method

  CatModel? catModel;
  void getCategoriesData() {
    DioHelper.getData(url: Home, lang: 'en').then((value) {
      catModel = CatModel.fromJson(value.data);

      emit(ShopSuccesDataCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorDataCategoriesState(error: '${error.toString()}'));
    });
  }
}
