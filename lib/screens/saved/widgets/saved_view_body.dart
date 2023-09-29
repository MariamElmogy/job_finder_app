import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_job_future_view_builder.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_list_view.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_view_body.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';

import '../../../utils/app_fonts.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SavedJobViewFutureBuilder(),
        ),
      ],
    );
  }
}
