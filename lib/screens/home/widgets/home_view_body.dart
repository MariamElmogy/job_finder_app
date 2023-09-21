import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job_view_future_builder.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job_view_futureBuilder.dart';
import 'custom_headline_widget.dart';
import 'custom_home_app_bar.dart';
import 'custom_search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHomeAppBar(),
        ),
        SliverToBoxAdapter(
          child: CustomSearchBar(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: CustomHeadlineWidget(title: 'Suggested Job'),
          ),
        ),
        SliverToBoxAdapter(
          child: SuggestJobViewFutureBuilder(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: CustomHeadlineWidget(title: 'Recent Job'),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: RecentJobViewFutureBuilder(),
          ),
        ),
      ],
    );
  }
}
