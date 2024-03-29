import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Core/Data/ViewModel/home_cubit.dart';
import 'package:news_app/Features/Home/home_view.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';
import 'package:news_app/Utils/Widgets/search_list_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    //final String searchKey;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AppFunctions.getMoveToNextPagePush(
                    context: context,
                    theScreenYouWantToProceed: const HomeView());
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.whiteColor,
              )),
          centerTitle: true,
          title: Text(
            'Find your new',
            style: getBodyStyle(),
          ),
          // const SizedBox(height: 30),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                // search bar
                child: TextFormField(
                  style: getBodyStyle(color: AppColors.whiteColor),
                  onChanged: (value) {
                    context.read<NewsCubit>().getBySearch(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                    ),
                    hintText: 'Search for News',
                  ),
                ),
              ),
              //search items
              const Gap(25),

              const Gap(50),
              const SearchListViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
