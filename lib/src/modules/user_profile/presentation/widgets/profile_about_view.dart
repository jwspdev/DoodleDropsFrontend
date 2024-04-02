// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doodle_drops/src/core/utils/extensions/date_extension.dart';
import 'package:doodle_drops/src/core/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';

import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';

class ProfileAboutPage extends StatelessWidget {
  final UserDetailsResponseEntity userDetailsResponseEntity;
  const ProfileAboutPage({
    Key? key,
    required this.userDetailsResponseEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 14,
            ),
            Text(
              ' Joined ${DateTime.parse('${userDetailsResponseEntity.updatedAt}').toMonthYearFormat()}',
              style: openSansMedium(fontSize: 12),
            ),
          ],
        ),
        const MediumHeightedSizedBox(),
        _buildLikedTags(),
        _buildLikedTags(),
        _buildLikedTags(),
        _buildLikedTags(),
        _buildLikedTags(),
        _buildLikedTags(),
      ],
    );
  }

  _buildLikedTags() {
    var likedTags = userDetailsResponseEntity.likedTags!;
    if (likedTags.isEmpty) {
      return const Text(
        'No Liked Tags',
      );
    }
    List<Widget> likedTagButtons = [];
    for (var tag in likedTags) {
      Widget tagWidget = SizedBox(
          height: 32,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {},
              child: Text('${tag.name}')));
      likedTagButtons.add(tagWidget);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Liked Tags',
              style: openSansSemiBold(fontSize: 16),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
          ],
        ),
        const SmallHeightedSizedBox(),
        Wrap(
          spacing: 6,
          runSpacing: 12,
          children: likedTagButtons,
        ),
      ],
    );
  }
}
