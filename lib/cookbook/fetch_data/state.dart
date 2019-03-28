import 'package:fish_redux/fish_redux.dart';

class Post extends Cloneable<Post> {
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json['json'],
      id: json['id'],
      title: json['title'],
      body: json['body']);

  int userId;
  int id;
  String title;
  String body;

  @override
  Post clone() => Post()
    ..body = body
    ..title = title
    ..id = id
    ..userId = userId;
}

Post initState(Map<Post, dynamic> args) => Post();
