import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/layout/categories/categories.dart';
import 'package:shop_app/layout/favourite/favourites.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/layout/settings/settings.dart';
import 'package:shop_app/models/categoriesModels/cat_model.dart';
import 'package:shop_app/models/shopHomeModel/favoritesmodel/changefavoritemodel.dart';
import 'package:shop_app/models/shopHomeModel/shop_home_model.dart';
import 'package:shop_app/models/shoploginModels/login_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(super.initialState);

  static ShopCubit get(context) => BlocProvider.of(context);

  int IndexShopScreens = 0;

  List<Widget> screensShop = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];
  void changeScreenShop(int index) {
    IndexShopScreens = index;
    emit(ShopChangeBottomNavState());
  }

  // data of home  shop
  HomeModel? homeModel;
  Map<int?, bool?> favs = {};
  void getData() {
    emit(ShopLoadingState());
    DioHelper.getData(url: Home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel?.data?.proudcts[0].img);
      //print(homeModel?.data?.banners.length);

      homeModel?.data!.proudcts.forEach((e) {
        favs.addAll({
          e.id: e.infav,
        });
      });
      print(favs);

      emit(ShopSuccesDataHomeState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorDataHomeState(error: '${error.toString()}'));
    });
  }

// get Categories method

  CatModel? catModel;
  void getCategoriesData() {
    DioHelper.getData(url: Get_CATEGORIES, lang: 'en').then((value) {
      catModel = CatModel.fromJson(value.data);

      emit(ShopSuccesDataCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorDataCategoriesState(error: '${error.toString()}'));
    });
  }

  //favourites add or delete fav item
  FavoriteModel? favoriteModel;
  void change_favorites(int? productId) {
    favs[productId] = !favs[productId]!;
    emit(ChangeFavoriteColor());
    DioHelper.postData(
      url: FAVOURITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      print(value.data);
      if (!favoriteModel!.status!) {
        favs[productId] = !favs[productId]!;
      }
      emit(ShopSuccesChangeFavoritesState());
    }).catchError((error) {
      favs[productId] = !favs[productId]!;
      emit(ShopErrorChangeFavoritesState(error: '${error.toString()}'));
    });
  }

  // profile data in settings screen
  ShopLoginModel? userProfileModel;
  void getUserProfile() {
    emit(ShopProfileLoadingState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userProfileModel = ShopLoginModel.fromJson(value.data);
      print(userProfileModel?.data!.email);

      print(userProfileModel?.data!.phone);

      print(userProfileModel?.data!.name);
      emit(ShopGetUserProfileDataSuccessState());
    }).catchError((error) {
      emit(ShopGetProfileErrorState(error: error.toString()));
    });
  }
}
