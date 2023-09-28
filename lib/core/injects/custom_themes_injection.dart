import 'package:get_it/get_it.dart';
import 'package:remote_config/core/remote_config/remote_config.dart';
import 'package:remote_config/features/custom_themes/data/datasource/custom_theme_datasource.dart';
import 'package:remote_config/features/custom_themes/data/datasource/custom_theme_datasource_impl.dart';
import 'package:remote_config/features/custom_themes/data/repository/custom_theme_repository_impl.dart';
import 'package:remote_config/features/custom_themes/domain/repository/custom_theme_repository.dart';
import 'package:remote_config/features/custom_themes/domain/usecases/custom_theme_usecase.dart';
import 'package:remote_config/features/custom_themes/domain/usecases/custom_theme_usecase_impl.dart';

sealed class CustomThemesInjection {
  static void inject(GetIt getIt) {
    getIt.registerFactory<CustomThemeDatasource>(
      () => CustomThemeDatasourceImpl(
        remoteConfig: getIt<RemoteConfig>(),
      ),
    );
    getIt.registerFactory<CustomThemeRepository>(
      () => CustomThemeRepositoryImpl(
        customThemeDatasource: getIt<CustomThemeDatasource>(),
      ),
    );

    getIt.registerFactory<CustomThemeUsecase>(
      () => CustomThemeUsecaseImpl(
        customThemeRepository: getIt<CustomThemeRepository>(),
      ),
    );
  }
}
