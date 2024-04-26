import 'package:flutter/material.dart';

import '/style/styles.dart';

class FlickrBadge extends StatelessWidget {
  final String photoTitle;

  const FlickrBadge({Key? key, required this.photoTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(mediumPadding),
        color: AppColors.bgDark,
        width: double.infinity,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: bigPadding),
              width: MediaQuery.of(context).size.width *
                  0.85, // to avoid overflowed text by N pixels
              child: Text(photoTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                  )),
            )
          ],
        )));
  }
}
