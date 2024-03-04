import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Core/Data/ViewModel/home_cubit.dart';
import 'package:news_app/Core/Data/ViewModel/home_states.dart';
import 'package:news_app/Core/Data/news_model.dart';
import 'package:news_app/Features/Home/news_details_view.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({
    super.key,
    // required this.searchKey
  });

  @override
  Widget build(BuildContext context) {
    //context.read<NewsCubit>().getBySearch();
    return BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
      if (state is NewsBySearchErrorState) {
        return Text(state.error);
      } else if (state is NewsBySearchSuccessState) {
        NewsModel news = state.model;
        return Expanded(
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Total Results :${news.articles!.length}',
                  style:
                      getSmallStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Gap(15),
            Expanded(
              child: ListView.builder(
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
                                  maxLines: 3,
                                  style: getSmallStyle(fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
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
                  }),
            ),
          ]),
        );
      } else
        return const Center(child: (CircularProgressIndicator()));
    });
  }
}
