import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/api_services.dart';
import 'package:news_app/Core/Data/ViewModel/home_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  //getByCategory
  getByCategory(String category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(error: e.toString()));
    }
  }

  //getBySearch
  getBySearch(String searchKey) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewsBySearch(searchKey).then((value) {
        emit(NewsBySearchSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState(error: e.toString()));
    }
  }
}
