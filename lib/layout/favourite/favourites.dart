import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/models/favoriteModel/favorite_model/datum.dart';
import 'package:shop_app/models/favoriteModel/favorite_model/favorite_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        builder: (context, state) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => favoriteItem(
                  ShopCubit.get(context).favoriteSModel!.data!.data![index]),
              separatorBuilder: (context, state) => Container(
                    color: Colors.blueGrey,
                    height: 4,
                  ),
              itemCount:
                  ShopCubit.get(context).favoriteSModel!.data!.data!.length);
        },
        listener: (context, state) {});
  }
}

class favoriteItem extends StatelessWidget {
  favoriteItem(
    this.model, {
    super.key,
  });

  final Datum model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 140,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  width: 120,
                  height: 120,
                  image: model.product!.image != null
                      ? NetworkImage(
                          '${model.product!.image}',
                        )
                      : NetworkImage(NullImg),
                  fit: BoxFit.cover,
                ),
                if (model.product!.discount != 0)
                  Container(
                    child: Text(
                      'DESCOUNT',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                  )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${model.product!.name}',
                    style: TextStyle(height: 1.3, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.product!.price.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      if (model.product!.oldPrice != 0)
                        Text(
                          '${model.product!.oldPrice.toString()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor:
                            ShopCubit.get(context).favs[model.product!.id]!
                                ? Colors.green
                                : Colors.grey,
                        child: IconButton(
                            onPressed: () {
                              ShopCubit.get(context)
                                  .change_favorites(model.product!.id);
                              // print(model.id);
                            },
                            icon: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
