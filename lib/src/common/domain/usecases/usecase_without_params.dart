abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();

  Future<T> call();
}