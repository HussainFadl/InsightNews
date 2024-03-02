import 'package:dio/dio.dart';
import 'package:news_app/Core/Constants/app_constants.dart';
import 'package:news_app/Home/Data/news_model.dart';

class ApiServices {
  // getByCategory(){} method

  static Future<NewsModel?> getNewsByCategory(String catergory) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}countery=us&category=$catergory&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // getSearch(){} method

  static Future<NewsModel?> getNewsBySearch(String searchKey) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}countery=us&q=$searchKey&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //  // getSource(){} method

  // static Future<NewsModel?> getNewsBySource(String searchKey) async {
  //   try {
  //     var response = await Dio().get(
  //         '${AppConstants.baseUrl}countery=us&q=$searchKey&apiKey=${AppConstants.apiKey}');
  //     if (response.statusCode == 200) {
  //       NewsModel news = NewsModel.fromJson(response.data);
  //       return news;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }
}
