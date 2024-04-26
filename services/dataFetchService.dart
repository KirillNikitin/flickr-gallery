import 'dart:convert';

import 'package:http/http.dart' as http;

class DatafetchService {
  final String flickrKey = "895e3a4c2f728e0f488be1b4cee4785b";

  Future fetchFlickrData([int? page]) async {
    page = page ?? 1;
    final queryParameters = {
      'method': 'flickr.interestingness.getList',
      'api_key': flickrKey,
      'format': 'json',
      'nojsoncallback': '1',
      'extras': 'owner_name,date_taken,tags,views',
      'page': page.toString()
    };

    final url = Uri.https('api.flickr.com', '/services/rest', queryParameters);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(
          'Failed to load Flickr data'); // some toast dialog can be implemented as well
    }
  }
}
