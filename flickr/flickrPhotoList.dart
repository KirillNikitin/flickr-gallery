import '/flickr/flickrPhoto.dart';

class FlickrPhotoList {
  int? page;
  int? pages;
  int? perpage;
  int? total;
  List<FlickrPhoto> photo;

  FlickrPhotoList(
      {this.page, this.pages, this.perpage, this.total, required this.photo});

  factory FlickrPhotoList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['photo'] as List;
    List<FlickrPhoto> photoList =
        list.map((i) => FlickrPhoto.fromJson(i)).toList();

    return FlickrPhotoList(
        page: parsedJson['page'],
        pages: parsedJson['pages'],
        perpage: parsedJson['perpage'],
        total: parsedJson['total'],
        photo: photoList);
  }
}
