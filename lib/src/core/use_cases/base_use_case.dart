//Base Use Case
abstract class BaseUseCase<Type, Params> {
  Future<Type> call({Params params});
}
