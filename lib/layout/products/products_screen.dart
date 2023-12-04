import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/models/shopHomeModel/shop_home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              ShopCubit.get(context).homeModel != null,
          widgetBuilder: (context) =>
              productsBuilder(ShopCubit.get(context).homeModel!),
          fallbackBuilder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget productsBuilder(HomeModel model) => Column(
        children: [
          CarouselSlider(
            items: model.data?.banners
                .map((e) => Image(
                      image: NetworkImage('${e.img}'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: .8,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.easeIn,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      );
}
