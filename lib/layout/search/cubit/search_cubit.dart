import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/components.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/models/SearchModel/sarch_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> searchList = [];
  List<SarchModel> searchListModel = [];
  void getSearch({required String text}) async {
    emit(SearchLoading());
    await DioHelper.postData(
            url: Search,
            lang: 'en',
            data: {
              'text': text,
            },
            token: token)
        .then((value) {
      value.data['data']['data'].forEach((e) {
        searchList.add(e);
      });
      searchList.forEach((element) {
        searchListModel.add(SarchModel.fromJson(element));
      });

      emit(SearchSuccess(searchListModel));
    }).catchError((error) {
      print(error.toString());
      emit(SearchError(error.toString()));
    });
  }
}
