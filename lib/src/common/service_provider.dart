abstract class ServiceProvider {
  const ServiceProvider();

  void registerBlocs();

  void registerUseCases();

  void registerRepositories();

  void registerDataSources();

  List getRoutes();

  void register() {
    registerBlocs();
    registerUseCases();
    registerRepositories();
    registerDataSources();
  }
}
