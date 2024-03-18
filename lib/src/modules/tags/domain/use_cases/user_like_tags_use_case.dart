import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/domain/repositories/tag_repository.dart';

class UserLikeTagsUseCase
    extends BaseUseCase<DataState<dynamic>, UserLikeTagParams> {
  final TagRepository _tagRepository;

  UserLikeTagsUseCase(this._tagRepository);

  @override
  Future<DataState> call({UserLikeTagParams? params}) {
    return _tagRepository.likeTagByUser(params!.token, params.request);
  }
}

class UserLikeTagParams {
  final String token;
  final TagUserLikeRequest request;

  UserLikeTagParams(this.token, this.request);
}
