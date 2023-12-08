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
