import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/params/paginate_params.dart';
import 'package:doodle_drops/src/modules/tags/domain/repositories/tag_repository.dart';

class TagListUseCase extends BaseUseCase<DataState<dynamic>, PaginateParams> {
  final TagRepository _tagRepository;

  TagListUseCase(this._tagRepository);
  @override
  Future<DataState> call({PaginateParams? params}) {
    return _tagRepository.getTagsList(params!.token, params.request);
  }
}
