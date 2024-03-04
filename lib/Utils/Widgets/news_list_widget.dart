import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Core/Data/ViewModel/home_cubit.dart';
import 'package:news_app/Core/Data/ViewModel/home_states.dart';
import 'package:news_app/Core/Data/news_model.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';
import 'package:news_app/Features/Home/news_details_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getByCategory(category);
    return BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
      if (state is NewsByCategoryErrorState) {
        return Text(state.error);
      } else if (state is NewsByCategorySuccessState) {
        NewsModel news = state.model;
        return ListView.builder(
            itemCount: news.articles?.length,
            itemBuilder: (context, index) {
              var newsItem = news.articles?[index];
              return InkWell(
                onTap: () {
                  AppFunctions.getMoveToNextPagePush(
                      context: context,
                      theScreenYouWantToProceed:
                          NewsDetailsView(model: newsItem!));
                },
                child: Container(
                  // width: 50,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        newsItem?.urlToImage ?? '',
                        width: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            width: 150,
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            newsItem?.title ?? '',
                            style: getSmallStyle(fontSize: 10),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.menu,
                                color: AppColors.whiteColor,
                                size: 14,
                              ),
                              const Gap(5),
                              Text('Read', style: getSmallStyle()),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            });
      } else
        return const Center(child: (CircularProgressIndicator()));
    });
  }
}
