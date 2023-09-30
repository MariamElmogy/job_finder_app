import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job_view_future_builder.dart';
import 'package:job_finder_app/screens/home/widgets/successful_applying_view_future_builder.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job_view_futureBuilder.dart';
import 'package:provider/provider.dart';
import 'custom_headline_widget.dart';
import 'custom_home_app_bar.dart';
import 'custom_search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final applicationState = Provider.of<ApplicationState>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomHomeAppBar(),
          ),
          const SliverToBoxAdapter(
            child: CustomSearchBar(),
          ),
          if (applicationState.dataSubmitted)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SuccessfulApplyingViewFutureBuilder(),
              ),
            ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: CustomHeadlineWidget(title: 'Suggested Job'),
            ),
          ),
          const SliverToBoxAdapter(
            child: SuggestJobViewFutureBuilder(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: CustomHeadlineWidget(title: 'Recent Job'),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: RecentJobViewFutureBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}



class ApplicationState with ChangeNotifier {
  bool _dataSubmitted = false;

  bool get dataSubmitted => _dataSubmitted;

  void setDataSubmitted(bool value) {
    _dataSubmitted = value;
    notifyListeners();
  }
}
