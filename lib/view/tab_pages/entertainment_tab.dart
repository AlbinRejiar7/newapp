import 'package:flutter/material.dart';
import 'package:real_time_news_app1/view/tab_pages/mytab_pages_widget/myfuture_builder_for_tabs.dart';

class EntertaimentTab extends StatelessWidget {
  final String country;
  const EntertaimentTab({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return MyFutureBuilderForTabs(
      category: 'category=entertainment',
      country: country,
    );
  }
}
