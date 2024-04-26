import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'style/styles.dart';

class DetailScreen extends StatelessWidget {
  final String? imageText;
  final String imageUrl;

  const DetailScreen({super.key, this.imageText, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      )
                  //errorWidget: new Icon(Icons.error), // - some error widget here
                  ),
              Padding(
                  padding: const EdgeInsets.all(bigPadding),
                  child: Text(imageText ?? '',
                      style: TextStyle(color: AppColors.white))),
            ],
          ),
        ),
        onVerticalDragUpdate: (details) {
          Navigator.pop(context);
        },
      ),
    );
  }
}
