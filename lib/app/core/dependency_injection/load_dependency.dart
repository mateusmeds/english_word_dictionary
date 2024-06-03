import 'package:english_word_dictionary/app/core/export.dart'
    show DependencyInjection, Enviroment;
import 'package:english_word_dictionary/app/domain/repositories/word_repository.dart';
import 'package:english_word_dictionary/app/external/datasources/impl/local_word_datasource_impl.dart';
import 'package:english_word_dictionary/app/external/datasources/impl/word_datasource_impl.dart';
import 'package:english_word_dictionary/app/external/http/export.dart';
import 'package:english_word_dictionary/app/infra/datasources/local_word_datasource.dart';
import 'package:english_word_dictionary/app/infra/datasources/word_datasource.dart';
import 'package:english_word_dictionary/app/infra/repositories/impl/word_repository_impl.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/word_details_bloc.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/favorite_words_cubit.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/word_history_cubit.dart';

class LoadDependency {
  static void load() {
    loadDataSources();
    loadRepositories();
    loadBlocs();
  }

  static void loadServices() {}

  static void loadDataSources() {
    DependencyInjection.registerDependency<LocalWordDatasource>(
      () => LocalWordDatasourceImpl(),
    );

    DependencyInjection.registerDependency<WordDatasource>(
      () => WordDatasourceImpl(
        HttpServiceImpl(
          baseUrl: Enviroment.apiBaseUrl,
        ),
      ),
    );
  }

  static void loadRepositories() {
    DependencyInjection.registerDependency<WordRepository>(
      () => WordRepositoryImpl(
        DependencyInjection.getDependency<WordDatasource>(),
        DependencyInjection.getDependency<LocalWordDatasource>(),
      ),
    );
  }

  static void loadBlocs() {
    DependencyInjection.registerDependency<WordDetailsBloc>(
      () => WordDetailsBloc(
        DependencyInjection.getDependency<WordRepository>(),
      ),
    );

    DependencyInjection.registerSingleton<WordHistoryCubit>(
      WordHistoryCubit(
        DependencyInjection.getDependency<WordRepository>(),
      ),
    );

    DependencyInjection.registerSingleton<FavoriteWordsCubit>(
      FavoriteWordsCubit(
        DependencyInjection.getDependency<WordRepository>(),
      ),
    );
  }
}
