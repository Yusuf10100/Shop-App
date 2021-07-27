abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeData extends ShopStates {}

class ShopSuccessHomeData extends ShopStates {}

class ShopErrorHomeData extends ShopStates {
  String error;
  ShopErrorHomeData({
     this.error,
  });
  
}
