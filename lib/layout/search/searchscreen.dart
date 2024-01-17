import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/layout/search/cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var searchContr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
