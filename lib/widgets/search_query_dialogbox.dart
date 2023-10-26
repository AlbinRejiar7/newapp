import 'package:flutter/material.dart';
import 'package:real_time_news_app1/view/query_search_page.dart';

// ignore: must_be_immutable
class SearchQueryDialogBox extends StatelessWidget {
  TextEditingController controller;
  SearchQueryDialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Search Your News'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Enter your query',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      actions: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyQueryPage(query: controller.text),
                  ));
            },
            icon: Icon(Icons.search),
            label: Text('Search'))
      ],
    );
  }
}
