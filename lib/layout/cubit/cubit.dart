import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/categories/categories.dart';
import 'package:shop_app/modules/favourites/favourite.dart';
import 'package:shop_app/modules/products/products.dart';
import 'package:shop_app/modules/settings/settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

// implementation of Bottom Navigation Bar
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];
  void changeBottomScreen(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

// implementation of getting home data from api
  HomeModel homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeData());

    DioHelper()
        .getData(
      url: HOME,
      token: token
    )
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel.data.banners[0].image);

      emit(ShopSuccessHomeData());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeData());
    });
  }
}
