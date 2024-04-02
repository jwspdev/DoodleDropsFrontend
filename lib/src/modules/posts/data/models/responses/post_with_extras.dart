import 'package:doodle_drops/src/modules/posts/data/models/post.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_with_extras_entity.dart';
import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';
import 'package:flutter/material.dart';

class PostWithExtras extends PostWithExtrasEntity {
  const PostWithExtras({
    required int id,
    required AuthorResponse author,
    required PostCounter postCounter,
    required List<TagModel> tags,
    String? title,
  }) : super(
            id: id,
            author: author,
            tags: tags,
            postCounter: postCounter,
            title: title);
  factory PostWithExtras.fromJson(Map<String, dynamic> map) {
    List<TagModel>? tags;
    if (map['tags'] != null) {
      tags = List<TagModel>.from(
          map['tags'].map((tagMap) => TagModel.fromJson(tagMap)));
    }
    // var postCounter = PostCounter.fromJson(map['post_counters']);
    var postWithExtras = PostWithExtras(
        id: map['id'] ?? 0,
        author: AuthorResponse.fromJson(map['author']),
        tags: tags ?? [],
        title: map['title'] ?? '',
        postCounter: PostCounter.fromJson(map['post_counters']));
    // debugPrint('TEST: ${postWithExtras}');
    return postWithExtras;
  }
}

class PostCounter extends PostCounterEntity {
  const PostCounter({super.commentCount, super.userLikedCount});

  factory PostCounter.fromJson(Map<String, dynamic> map) {
    return PostCounter(
        commentCount: map['comment_count'] ?? 0,
        userLikedCount: map['user_liked_count'] ?? 0);
  }
}
