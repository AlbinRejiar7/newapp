// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MycategoryModel extends StatelessWidget {
  String image;
  final String headLine;
  MycategoryModel({super.key, required this.image, required this.headLine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: NetworkImage(image)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                headLine,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
