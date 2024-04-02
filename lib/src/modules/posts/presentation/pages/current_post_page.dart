import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_with_extras_entity.dart';
import 'package:flutter/material.dart';

class CurrentPostPage extends StatelessWidget {
  final PostWithExtrasEntity entity;
  static String routePath = '/current_post_page';
  const CurrentPostPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$entity'),
      ),
    );
  }
}
