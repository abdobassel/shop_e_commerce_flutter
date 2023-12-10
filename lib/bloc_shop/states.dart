abstract class ShopStates {}

class ShopInitializeState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingState extends ShopStates {}

class ShopSuccesDataHomeState extends ShopStates {}

class ShopErrorDataHomeState extends ShopStates {
  final String error;

  ShopErrorDataHomeState({required this.error});
}

class ShopSuccesDataCategoriesState extends ShopStates {}

class ShopErrorDataCategoriesState extends ShopStates {
  final String error;

  ShopErrorDataCategoriesState({required this.error});
}

class ShopSuccesChangeFavoritesState extends ShopStates {}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;

  ShopErrorChangeFavoritesState({required this.error});
}

class ChangeFavoriteColor extends ShopStates {}

class ShopGetUserProfileDataSuccessState extends ShopStates {}

class ShopProfileLoadingState extends ShopStates {}

class ShopGetProfileErrorState extends ShopStates {
  final String error;

  ShopGetProfileErrorState({required this.error});
}

class ShopUpdateUserProfileDataSuccessState extends ShopStates {}

class ShopUpdateProfileLoadingState extends ShopStates {}

class ShopUpdateProfileErrorState extends ShopStates {
  final String error;

  ShopUpdateProfileErrorState({required this.error});
}
