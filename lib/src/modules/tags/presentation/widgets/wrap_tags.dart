import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapTags extends StatelessWidget {
  final List<TagEntity>? tags;
  final bool? isBig;
  const WrapTags({super.key, this.tags, this.isBig = false});

  @override
  Widget build(BuildContext context) {
    return tags!.isNotEmpty
        ? Center(
            child: Wrap(
              children: _buildTags(),
            ),
          )
        : Text('Emtpy');
  }

  List<Widget> _buildTags() {
    List<Widget> tagList = [];

    for (var tag in tags!) {
      tagList.add(ElevatedButton(onPressed: () {}, child: Text('${tag.name}')));
    }

    return tagList;
  }
}
