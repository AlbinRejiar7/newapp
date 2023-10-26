import 'package:flutter/material.dart';

import 'mytab_pages_widget/myfuture_builder_for_tabs.dart';

class TopheadlineTab extends StatelessWidget {
  final String country;
  const TopheadlineTab({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return MyFutureBuilderForTabs(
      country: country,
    );
  }
}
