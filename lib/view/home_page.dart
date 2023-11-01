// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real_time_news_app1/view/tab_pages/business_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/entertainment_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/science_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/sports_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/technology_tab.dart';
import 'package:real_time_news_app1/view/tab_pages/topheadline_tab.dart';
import 'package:real_time_news_app1/widgets/search_query_dialogbox.dart';

import '../contants/country_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedCountry = 'in';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: SafeArea(
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Select The Country ',
                      style: TextStyle(fontSize: 17),
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(20),
                      value: selectedCountry,
                      items: countryAbbreviations.map((country) {
                        return DropdownMenuItem<String>(
                          value: country[0],
                          child: Text(country[1]),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
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
                        useSafeArea: true,
                        context: context,
                        builder: (context) => SearchQueryDialogBox());
                  },
                  icon: Icon(Icons.search)),
              SizedBox(
                width: 15,
              ),
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
