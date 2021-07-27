import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/home_model.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null,
            builder: (context) =>
                carouselSlider(ShopCubit.get(context).homeModel),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget carouselSlider(HomeModel model) {
    return Column(
      children: [
        CarouselSlider(
          items: model.data.banners
              .map((e) => Image(
                    image: NetworkImage('${e.image}'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ))
              .toList(),
          options: CarouselOptions(
            reverse: false,
            autoPlay: true,
            height: 250.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.bounceOut,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.9,
          ),
        ),
      ],
    );
  }
}
