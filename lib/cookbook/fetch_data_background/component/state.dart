import 'package:fish_redux/fish_redux.dart';

class Photo implements Cloneable<Photo> {
  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.formJson(Map<String, dynamic> json) => Photo(
      thumbnailUrl: json['thumbnailUrl'],
      title: json['title'],
      id: json['id'],
      albumId: json['albumId'],
      url: json['url']);
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  @override
  Photo clone() => Photo()
    ..albumId = albumId
    ..id = id
    ..url = url
    ..title = title
    ..thumbnailUrl = thumbnailUrl;
}

Photo initState(Map<Photo, dynamic> args) => Photo();
