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
          }
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              DefaultTextForm(
                                  onchange: (s) {
                                    SearchCubit.get(context)
                                        .getSearch(text: s!);
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
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: searchlist.length,
                            itemBuilder: (context, index) => Padding(
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
                                )),
                      ]),
                ),
              ));
        }));
  }
}
