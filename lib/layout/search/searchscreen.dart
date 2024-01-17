import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/layout/search/cubit/search_cubit.dart';
import 'package:shop_app/models/SearchModel/sarch_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var searchContr = TextEditingController();
  List<SarchModel> searchlist = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
        child:
            BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
          if (state is SearchSuccess) {
            searchlist = state.searchs;
          } else {
            searchlist = [];
          }
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            DefaultTextForm(
                                onSubmit: (s) {
                                  SearchCubit.get(context).getSearch(text: s!);
                                },
                                controller: searchContr,
                                labeltext: 'Search...',
                                validate: (value) {
                                  if (value != null) {
                                    if (value.isNotEmpty) {
                                      return 'noo';
                                    }
                                    return null;
                                  }
                                },
                                type: TextInputType.text,
                                prefix: Icons.search)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (state is! SearchLoading)
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => Container(
                                    width: double.infinity,
                                    color: Colors.black12,
                                    height: 4,
                                  ),
                              physics: BouncingScrollPhysics(),
                              itemCount: searchlist.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            '${searchlist[index].image}',
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${searchlist[index].name}',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Spacer(),
                                                Text(
                                                  r'السعر '
                                                  '${searchlist[index].price}',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      if (state is SearchLoading)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                    ]),
              ));
        }));
  }
}

/*
Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    height: 160,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.network(
                                          searchlist[index].image!,
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              searchlist[index].name!,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              searchlist[index].description!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              r'price '
                                              '${searchlist[index].price!}',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )

 */