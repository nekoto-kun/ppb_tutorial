import 'package:flutter/material.dart';
import 'package:ppb_tutorial/models/post.dart';
import 'package:ppb_tutorial/services/post_service.dart';
import 'package:ppb_tutorial/widgets/post_card.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
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
                  ),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
