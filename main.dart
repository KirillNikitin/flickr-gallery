import 'package:flutter/material.dart';
import 'package:flickr_gallery_app/flickrPhotoFeed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Flickr Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FlickrPhotoFeed());
  }
}
