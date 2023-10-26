import 'package:flutter/material.dart';

import 'mytab_pages_widget/myfuture_builder_for_tabs.dart';

class SportsTab extends StatelessWidget {
  final String country;
  const SportsTab({super.key, required this.country});
  @override
  Widget build(BuildContext context) {
    return MyFutureBuilderForTabs(
      category: 'category=sports',
      country: country,
    );
  }
}
