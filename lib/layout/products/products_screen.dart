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

  Widget productsBuilder(HomeModel model) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryItemBuilder();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 14,
                            ),
                        itemCount: 10),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('New Products',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.59,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      model.data!.proudcts.length,
                      (index) =>
                          GridProductBuilder(model.data!.proudcts[index]))),
            ),
          ],
        ),
      );

  Widget CategoryItemBuilder() =>
      Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Image(
          width: 100,
          fit: BoxFit.cover,
          height: 100,
          image: 1 == 1
              ? NetworkImage(
                  NullImg,
                )
              : NetworkImage(NullImg),
        ),
        Container(
            color: Colors.black.withOpacity(.8),
            width: 100,
            child: Text(
              'Eloctric',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            )),
      ]);

  Widget GridProductBuilder(ProductModel model) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  width: double.infinity,
                  height: 200,
                  image: model.img != null
                      ? NetworkImage(
                          '${model.img}',
                        )
                      : NetworkImage(NullImg),
                ),
                if (model.discount != 0)
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    '${model.name}',
                    style: TextStyle(height: 1.3, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldPrice.round()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

String NullImg =
    'https://image.similarpng.com/very-thumbnail/2020/12/Shopping-cart-with-gift-boxes-and-shopping-bags-from-online-shop-for-e-commerce-marketing-on-transparent-PNG.png';
