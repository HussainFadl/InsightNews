import 'package:news_app/Core/Data/news_model.dart';

class NewsStates {}

class NewsInitState extends NewsStates {}
// getByCategory()[Loading, Success, Error]

class NewsByCategoryLoadingState extends NewsStates {}

class NewsByCategorySuccessState extends NewsStates {
  final NewsModel model;
  NewsByCategorySuccessState({required this.model});
}

class NewsByCategoryErrorState extends NewsStates {
  final String error;
  NewsByCategoryErrorState({required this.error});
}


// getBySearch()

class NewsBySearchLoadingState extends NewsStates {}

class NewsBySearchSuccessState extends NewsStates {
  final NewsModel model;
  NewsBySearchSuccessState({required this.model});
}

class NewsBySearchErrorState extends NewsStates {
  final String error;
  NewsBySearchErrorState({required this.error});
}
