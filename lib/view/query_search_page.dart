// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real_time_news_app1/model/news_model_container.dart';
import 'package:real_time_news_app1/controller/networking/networking.dart';

import 'detail_news_page.dart';

// ignore: must_be_immutable
class MyQueryPage extends StatelessWidget {
  String? query;

  MyQueryPage({super.key, this.query});

  @override
  Widget build(BuildContext context) {
    NetworkHelper networkHelper = NetworkHelper();
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: networkHelper.fetchQueryData(query: query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('error'));
            } else {
              return ListView.builder(
                itemCount: networkHelper.dataModel?.articles?.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsNewsPage(
                          title:
                              networkHelper.dataModel?.articles?[index].title ??
                                  'SomethingWrong',
                          image: networkHelper
                                  .dataModel?.articles?[index].urlToImage ??
                              'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage_%E3%83%92%E3%82%9A%E3%82%AF%E3%83%88-760x460.png',
                          description: networkHelper
                                  .dataModel?.articles?[index].content ??
                              'somethingWrong',
                        ),
                      ));
                    },
                    child: MycategoryModel(
                        image: networkHelper
                                .dataModel?.articles?[index].urlToImage ??
                            'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage_%E3%83%92%E3%82%9A%E3%82%AF%E3%83%88-760x460.png',
                        headLine: networkHelper
                                .dataModel?.articles?[index].title
                                .toString() ??
                            'No title'),
                  );
                },
              );
            }
          },
        ));
  }
}
