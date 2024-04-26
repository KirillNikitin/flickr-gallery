import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:flickr_gallery_app/style/styles.dart';

import 'detailScreen.dart';
import 'flickr/flickrBadge.dart';
import 'flickr/flickrPhoto.dart';
import 'flickr/flickrResult.dart';
import 'services/dataFetchService.dart';

class FlickrPhotoFeed extends StatefulWidget {
  const FlickrPhotoFeed({Key? key}) : super(key: key);

  @override
  _FlickrPhotoFeedState createState() => _FlickrPhotoFeedState();
}

class _FlickrPhotoFeedState extends State<FlickrPhotoFeed> {
  final _datafetchService = DatafetchService();
  late FlickrResult flickrData;
  int resultsCount = 0;
  int page = 1; // page 1 by default
  late int pages;

  @override
  void initState() {
    super.initState();

    _loadFlickrData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                'Flutter Flickr Gallery')), // all the texts should be available from localization
        body: SwipeTo(
          child: RefreshIndicator(
            onRefresh: () =>
                _loadFlickrData(), // or _loadFlickrData(page) if we want to stay on the page where we swiped to
            child: ListView.builder(
                itemCount: resultsCount,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                }),
          ),
          // pagination made on swipe to left/right
          onLeftSwipe: (details) {
            if (page < pages) {
              _loadFlickrData(page + 1).then((value) => setState(() {
                    page++;
                  }));
            }
          },
          onRightSwipe: (details) {
            if (page > 1) {
              _loadFlickrData(page - 1).then((value) => setState(() {
                    page--;
                  }));
            }
          },
        ));
  }

  Widget getRow(int i) {
    FlickrPhoto photo = flickrData.photos.photo[i];
    String farm = photo.farm.toString();
    String? secret = photo.secret;
    String? server = photo.server;

    String photoUrl =
        "https://farm$farm.staticflickr.com/$server/${photo.id}_$secret.jpg";

    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.all(mediumPadding),
            child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                    imageUrl: photoUrl,
                    height:
                        240.0, // also could be some separate style parameter
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  FlickrBadge(photoTitle: photo.title ?? '')
                ])),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(
              imageText: photo.title,
              imageUrl: photoUrl,
            );
          }));
        });
  }

  Future<void> _loadFlickrData([int? page]) async {
    final data = await _datafetchService.fetchFlickrData(page);

    setState(() {
      Map<String, dynamic> userMap = data;
      flickrData = FlickrResult.fromJson(userMap);
      resultsCount = flickrData.photos.photo.length;
      pages = flickrData.photos.pages!;
    });
  }
}
