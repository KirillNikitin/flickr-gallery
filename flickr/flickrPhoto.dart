class FlickrPhoto {
  String? id;
  String? owner;
  String? secret;
  String? server;
  int? farm;
  String? title;
  int? ispublic;
  int? isfriend;
  int? isfamily;
  String? ownerName;
  DateTime? dateTaken;
  int? numViews;

  FlickrPhoto(
      {this.id,
      this.owner,
      this.secret,
      this.server,
      this.farm,
      this.title,
      this.ispublic,
      this.isfriend,
      this.isfamily,
      this.ownerName,
      this.dateTaken,
      this.numViews});

  factory FlickrPhoto.fromJson(Map<String, dynamic> parsedJson) {
    return FlickrPhoto(
        id: parsedJson['id'],
        owner: parsedJson['owner'],
        secret: parsedJson['secret'],
        server: parsedJson['server'],
        farm: parsedJson['farm'],
        title: parsedJson['title'],
        ispublic: parsedJson['ispublic'],
        isfriend: parsedJson['isfriend'],
        isfamily: parsedJson['isfamily'],
        ownerName: parsedJson['ownername'],
        dateTaken: DateTime.parse(parsedJson['datetaken']),
        numViews: int.parse(parsedJson['views']));
  }
}
