// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real_time_news_app1/view/tab_pages/business_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/entertainment_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/science_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/sports_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/technology_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/topheadline_tab.dart';
import 'package:real_time_news_app1/widgets/search_query_dialogbox.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> countryAbbreviations = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];

  String? selectedCountry = 'in';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            bottom: TabBar(isScrollable: true, tabs: [
              Text(
                'Top Headlines',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'Sports',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'science',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'business',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'technology',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'entertainment',
                style: TextStyle(fontSize: 17),
              ),
            ]),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            SearchQueryDialogBox(controller: controller));
                  },
                  icon: Icon(Icons.search)),
              SizedBox(
                width: 15,
              ),
              DropdownButton<String>(
                value: selectedCountry,
                items: countryAbbreviations.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                },
              )
            ],
            centerTitle: true,
            title: Text(
              'X Y Z    N E W S',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.red.shade900,
          ),
          body: TabBarView(children: [
            TopheadlineTab(
              country: selectedCountry!,
            ),
            SportsTab(
              country: selectedCountry!,
            ),
            ScienceTab(
              country: selectedCountry!,
            ),
            BusinessTab(
              country: selectedCountry!,
            ),
            TechnologyTab(
              country: selectedCountry!,
            ),
            EntertaimentTab(
              country: selectedCountry!,
            ),
          ])),
    );
  }
}
