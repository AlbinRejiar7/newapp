import 'package:flutter/material.dart';
import 'package:real_time_news_app1/view/tab_pages/mytab_pages_widget/myfuture_builder_for_tabs.dart';

class BusinessTab extends StatelessWidget {
  final String country;
  const BusinessTab({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return MyFutureBuilderForTabs(
      category: 'category=business',
      country: country,
    );
  }
}
