import 'package:doodle_drops/src/dependency_injection/injection_container.dart';
import 'package:doodle_drops/src/modules/posts/presentation/bloc/post_bloc.dart';
import 'package:doodle_drops/src/modules/posts/presentation/pages/current_post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PostListPage extends StatefulWidget {
  final int? userId;
  const PostListPage({super.key, this.userId});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<PostBloc>(
      create: (context) => sl()
        ..add(widget.userId == null
            ? const GetPostListEvent()
            : GetPostListEvent(userId: widget.userId!)),
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else {
          var posts = state.posts;
          if (posts!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<PostBloc>(context).add(widget.userId == null
                    ? const GetPostListEvent()
                    : GetPostListEvent(userId: widget.userId!));
              },
              child: ListView.builder(
                  shrinkWrap: widget.userId != null ? true : false,
                  physics: widget.userId != null
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.push(CurrentPostPage.routePath,
                            extra: posts[index]);
                      },
                      title:
                          Text('${posts[index].title} $index ${posts.length}'),
                      subtitle: Text('${posts[index].author?.displayName}'),
                      trailing:
                          Text('${posts[index].postCounter?.commentCount}'),
                    );
                  }),
            );
          } else {
            return Container();
          }
        }
      }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
