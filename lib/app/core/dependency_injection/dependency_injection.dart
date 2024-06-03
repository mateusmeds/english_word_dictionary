import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show GetIt;

class DependencyInjection {
  static final GetIt _getIt = GetIt.instance;

  static registerDependency<T extends Object>(T Function() func,
      {String? instanceName}) {
    if (!_getIt.isRegistered<T>(instanceName: instanceName)) {
      _getIt.registerFactory<T>(func, instanceName: instanceName);
    }
  }

  static registerSingleton<T extends Object>(T instance,
      {String? instanceName}) {
    if (!_getIt.isRegistered<T>(instanceName: instanceName)) {
      _getIt.registerSingleton<T>(instance, instanceName: instanceName);
    }
  }

  static T getDependency<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }
}
