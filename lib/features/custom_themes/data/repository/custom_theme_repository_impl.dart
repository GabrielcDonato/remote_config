import 'package:dartz/dartz.dart';
import 'package:remote_config/core/failures/failures.dart';
import 'package:remote_config/core/remote_config/exceptions/remote_config_exception.dart';
import 'package:remote_config/features/custom_themes/data/datasource/custom_theme_datasource.dart';
import 'package:remote_config/features/custom_themes/domain/entities/custom_themes_entity.dart';
import 'package:remote_config/features/custom_themes/domain/repository/custom_theme_repository.dart';

class CustomThemeRepositoryImpl implements CustomThemeRepository {
  final CustomThemeDatasource _customThemeDatasource;

  CustomThemeRepositoryImpl(
      {required CustomThemeDatasource customThemeDatasource})
      : _customThemeDatasource = customThemeDatasource;

  @override
  Future<Either<Failure, CustomThemesEntity>> getAvailableThemes() async {
    try {
      final result = _customThemeDatasource.getAvailableThemes();
      return Right(result);
    } on RemoteConfigException catch (e) {
      return Left(
        RemoteConfigThemeFailure(
          e.message ?? 'Error to search available themes',
        ),
      );
    }
  }
}
