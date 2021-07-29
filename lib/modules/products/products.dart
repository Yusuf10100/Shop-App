import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/shared/components/constants.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null,
            builder: (context) {
              return productBuilder(ShopCubit.get(context).homeModel);
            },
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget productBuilder(HomeModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          carouselSlider(model),
          SizedBox(
            height: 10,
          ),
          productGridView(model)
        ],
      ),
    );
  }
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

Widget productGridView(HomeModel model) {
  return Container(
    color: Colors.grey[300],
    child: GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      childAspectRatio: 1 / 1.62,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        model.data.products.length,
        (index) => Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                      '${model.data.products[index].image}',
                    ),
                    height: 200.0,
                    // fit: BoxFit.cover,
                  ),
                  if (model.data.products[index].discount != 0)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.data.products[index].name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(height: 1.3),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${model.data.products[index].price.round()}',
                          style: TextStyle(color: defaultColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if (model.data.products[index].discount != 0)
                          Text(
                            '${model.data.products[index].oldPrice.round()}',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
