import 'package:flutter/material.dart';
import 'package:myapp/models/post.dart';
import 'package:myapp/services/post_service.dart';
import 'package:myapp/widgets/post_card.dart';

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = PostService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!
                .map(
                  (post) => PostCard(
                    title: post.title,
                    body: post.body,
                  )
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
