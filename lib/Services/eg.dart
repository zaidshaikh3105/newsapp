import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsapp/news/Nmodel.dart';

Widget customList(Article article, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            // width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Container(
          height: 100,
          width: size.width,
          color: Colors.white54,
          child: Text(
            article.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    ],
  );
}
