import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc_shop/cubit.dart';
import 'package:shop_app/bloc_shop/states.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/models/categoriesModels/cat_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return categoryBuilder(
                    ShopCubit.get(context).catModel!.data!.data[index]);
              },
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Divider(height: 5, color: Colors.grey),
                  ),
              itemCount: ShopCubit.get(context).catModel!.data!.data.length);
        });
  }

  Widget categoryBuilder(DataModel model) => Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                '${model.img}',
              ),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            SizedBox(
              width: 15,
            ),
            Text('${model.name}'),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
}
