import '/flickr/flickrPhotoList.dart';

class FlickrResult {
  FlickrPhotoList photos;
  String stat;

  FlickrResult({required this.photos, required this.stat});

  factory FlickrResult.fromJson(Map<String, dynamic> parsedJson) {
    var photoList = FlickrPhotoList.fromJson(parsedJson['photos']);

    return FlickrResult(photos: photoList, stat: parsedJson['stat']);
  }
}
