import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  final int userId;
  final int id;
  final String title;

  final String body;
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

void main() => runApp(MyApp(
      post: fetchPost(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.post}) : super(key: key);
  final Future<Post> post;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
          ),
          body: Center(
            child: FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error);
                  }

                  return const CircularProgressIndicator();
                }),
          ),
        ),
      );
}
