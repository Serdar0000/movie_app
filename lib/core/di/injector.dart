import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../exceptions/error_handler.dart';
import '../network/api_client.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/datasources/home_remote_data_source_impl.dart';
import '../../features/home/data/interactors/movie_interactor_impl.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/interactors/movie_interactor.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/favorite/data/datasources/favorite_local_data_source.dart';
import '../../features/favorite/data/datasources/favorite_local_data_source_impl.dart';
import '../../features/favorite/data/repositories/favorite_repository_impl.dart';
import '../../features/favorite/domain/repositories/favorite_repository.dart';
import '../../features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../features/detail/data/datasources/detail_remote_data_source.dart';
import '../../features/detail/data/datasources/detail_remote_data_source_impl.dart';
import '../../features/detail/data/repositories/detail_repository_impl.dart';
import '../../features/detail/domain/repositories/detail_repository.dart';
import '../../features/detail/presentation/bloc/detail_bloc.dart';
import '../../features/home/presentation/presenter/movie_presenter.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize SharedPreferences first
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register ApiClient (wraps Dio configured with token)
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<ErrorHandler>(() => ErrorHandler());

  // Register Home data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<ApiClient>()),
  );

  // Register Home repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()),
  );

  // Register Favorite data sources
  getIt.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(getIt<SharedPreferences>()),
  );

  // Register Favorite repositories
  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt<FavoriteLocalDataSource>()),
  );

  // Register Detail data sources
  getIt.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(getIt<ApiClient>()),
  );

  // Register Detail repositories
  getIt.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(getIt<DetailRemoteDataSource>()),
  );

  // Register home business logic
  getIt.registerLazySingleton<MovieInteractor>(
    () => MovieInteractorImpl(
      homeRepository: getIt<HomeRepository>(),
      favoriteRepository: getIt<FavoriteRepository>(),
    ),
  );

  // Register presenters and BLoCs
  getIt.registerFactory<MoviePresenter>(
    () => MoviePresenter(getIt<MovieInteractor>(), getIt<ErrorHandler>()),
  );

  getIt.registerLazySingleton<FavoriteBloc>(
    () => FavoriteBloc(getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<DetailBloc>(
    () => DetailBloc(getIt<DetailRepository>()),
  );
}
