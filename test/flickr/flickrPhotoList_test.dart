import 'package:flutter_test/flutter_test.dart';
import 'package:flickr_gallery_app/flickr/flickrPhotoList.dart';

void main() {
  final flickrPhotoList =
      FlickrPhotoList(page: 1, pages: 5, perpage: 100, total: 500, photo: []);
  test('test 1', () {
    expect(flickrPhotoList.page, 1);
  });

  test('test 2', () {
    expect(flickrPhotoList.pages, 5);
  });

  test('test 3', () {
    expect(flickrPhotoList.perpage, 100);
  });

  test('test 4', () {
    expect(flickrPhotoList.total, 500);
  });

  test('test 5', () {
    expect(flickrPhotoList.photo.isEmpty, true);
  });
}
