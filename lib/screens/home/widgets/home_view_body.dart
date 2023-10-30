import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job_view_future_builder.dart';
import 'package:job_finder_app/screens/home/widgets/successful_applying_view_future_builder.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job_view_futureBuilder.dart';
import 'package:job_finder_app/screens/search/views/search_view.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import 'custom_headline_widget.dart';
import 'custom_home_app_bar.dart';

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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                )),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppImages.kSearch),
                      const SizedBox(width: 10),
                      const Text(
                        'Search....',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kRegisterHints,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (applicationState._dataSubmitted)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
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
