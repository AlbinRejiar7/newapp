// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_time_news_app1/contants/country_details.dart';
import 'package:real_time_news_app1/view/query_search_page.dart';

class SearchQueryDialogBox extends StatefulWidget {
  SearchQueryDialogBox({
    super.key,
  });

  @override
  State<SearchQueryDialogBox> createState() => _SearchQueryDialogBoxState();
}

class _SearchQueryDialogBoxState extends State<SearchQueryDialogBox> {
  TextEditingController controller = TextEditingController();
  final TextEditingController _dateFromController = TextEditingController();
  final TextEditingController _dateToController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? sortByData = 'relevancy';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: AlertDialog(
        title: Text('Search Your News'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text('Sort By'),
                const Spacer(),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: sortByData,
                  items: sortBy.map((String sort) {
                    return DropdownMenuItem<String>(
                      value: sort,
                      child: Text(sort),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      sortByData = newValue;
                    });
                  },
                ),
              ],
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Enter your query',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => _selectFromDate(context),
                    child: Icon(Icons.calendar_month_outlined)),
                SizedBox(
                  width: 15,
                ),
                Text('From ${_dateFromController.text}')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => _selectToDate(context),
                    child: Icon(Icons.calendar_month_outlined)),
                SizedBox(
                  width: 15,
                ),
                Text('To ${_dateToController.text}')
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MyQueryPage(
                    query: controller.text,
                    sortBy: sortByData,
                  );
                })).then((_) => controller.clear());
              },
              icon: Icon(Icons.search),
              label: Text('Search'))
        ],
      ),
    );
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateFromController.text = DateFormat('yyyy-MM-dd')
            .format(picked); // Format the date as per your requirement
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateToController.text = DateFormat('yyyy-MM-dd')
            .format(picked); // Format the date as per your requirement
      });
    }
  }
}
