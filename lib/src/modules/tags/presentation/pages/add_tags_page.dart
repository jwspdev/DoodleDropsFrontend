import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/home_page/landing_page.dart';
import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:doodle_drops/src/modules/tags/presentation/bloc/tag_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTagsPage extends StatefulWidget {
  const AddTagsPage({super.key});

  static String routePath = '/add_tags_page';

  @override
  State<AddTagsPage> createState() => _AddTagsPageState();
}

class _AddTagsPageState extends State<AddTagsPage> {
  bool isButtonEnabled = false;
  int page = 1;
  List<TagEntity> selectedTags = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  //TODO FIX LOADING
  Widget _buildListView({required List<TagEntity> tags}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 60),
      child: GridView.builder(
        controller: context.read<TagBloc>().scrollController,
        itemCount:
            context.read<TagBloc>().isLoadingMore ? tags.length : tags.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          var currentTag = tags[index];
          if (index >= tags.length) {
            if (context.read<TagBloc>().isLoadingMore) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedTags.contains(currentTag)) {
                  selectedTags.remove(currentTag);
                } else {
                  selectedTags.add(currentTag);
                }
                isButtonEnabled = selectedTags.isNotEmpty;
              });
            },
            child: Container(
              height: 150,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedTags.contains(currentTag)
                    ? Colors.grey[300]
                    : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${tags[index].name} $index',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${tags[index].tagType}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _testScroll() {
    // if (_gridViewScrollController.position.pixels ==
    //     _gridViewScrollController.position.maxScrollExtent) {
    //   BlocProvider.of<TagBloc>(context).add(GetTagList(page: page, limit: 10));
    //   page++;
    // } else {
    //   debugPrint('dont call');
    // }
  }

  Widget _buildLikedTags() {
    return Wrap(
      children: _listOfLikedTags(),
    );
  }

  List<Widget> _listOfLikedTags() {
    List<Widget> listOfLikedTags = [];
    for (var tag in selectedTags) {
      Widget tagWidget = Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(onPressed: () {}, child: Text('${tag.name}')),
      );
      listOfLikedTags.add(tagWidget);
    }
    return listOfLikedTags;
  }

  @override
  Widget build(BuildContext context) {
    var tagBlocProvider = BlocProvider.of<TagBloc>(context);
    var userBlocProvier = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Tags'),
          actions: [
            ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        List<int> idList = [];
                        for (var tag in selectedTags) {
                          idList.add(tag.id!);
                        }
                        tagBlocProvider
                            .add(UserLikeTagEvent(tagRequest: idList));
                        userBlocProvier.add(CheckIfAuthenticatedEvent());
                      }
                    : null,
                child: Text('save'))
          ],
          centerTitle: true,
        ),
        body: BlocConsumer<TagBloc, TagState>(listener: (context, state) {
          if (state is UserLikeTagState) {
            debugPrint('$state');
            Future.delayed(Duration(seconds: 1), () {
              context.go(SplashScreen.routePath);
            });
          }
        }, builder: (context, state) {
          if (state is TagInitial) {
            return const CupertinoActivityIndicator();
          }
          if (state is TagListRetrievedState) {
            var tags = state.tagListResponse;
            return Column(
              children: [
                selectedTags.isNotEmpty ? _buildLikedTags() : Container(),
                Flexible(child: _buildListView(tags: tags!)),
              ],
            );
          }
          if (state is TagErrorState) {
            return Text('Error!');
          }
          return const CupertinoActivityIndicator();
        }));
  }
}
