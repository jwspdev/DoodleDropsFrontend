import 'package:dio/dio.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/local/secured_storage_service.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/remote/authentication_api_service.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/token_repository_implementation.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/user_auth_repository_impl.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/user_details_repository_implementation.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_auth_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_details_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/auth_login_use_case.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/auth_register_use_case.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/user_details_use_case.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/tags/data/data_sources/remote/tag_api_service.dart';
import 'package:doodle_drops/src/modules/tags/data/repository/tag_repository_impl.dart';
import 'package:doodle_drops/src/modules/tags/domain/repositories/tag_repository.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/tag_list_use_case.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/user_like_tags_use_case.dart';
import 'package:doodle_drops/src/modules/tags/presentation/bloc/tag_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton(Dio());

  //retrofit api services
  sl.registerSingleton(AuthenticationApiService(sl()));
  sl.registerSingleton(TagApiService(sl()));

  //local storage services
  sl.registerSingleton(SecuredStorageService());

  //repositories
  sl.registerSingleton<UserAuthRepository>(
      UserAuthRepositoryImplementation(sl()));

  sl.registerSingleton<TokenRepository>(TokenRepositoryImplementation(sl()));

  sl.registerSingleton<TagRepository>(TagRepositoryImplementation(sl()));

  sl.registerSingleton<UserDetailsRepository>(
      UserDetailsRepositoryImplementation(sl()));
  //use cases
  sl.registerSingleton<AuthLoginUseCase>(AuthLoginUseCase(sl()));
  sl.registerSingleton<AuthRegisterUseCase>(AuthRegisterUseCase(sl()));
  sl.registerSingleton(UserDetailsUseCase(sl()));
  sl.registerSingleton(TagListUseCase(sl()));
  sl.registerSingleton(UserLikeTagsUseCase(sl()));
  //blocs
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => TagBloc(sl(), sl(), sl()));
}
