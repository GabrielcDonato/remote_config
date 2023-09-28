import 'package:dartz/dartz.dart';
import 'package:remote_config/core/failures/failures.dart';
import 'package:remote_config/features/custom_themes/domain/entities/custom_themes_entity.dart';

abstract interface class CustomThemeRepository {
  Future<Either<Failure, CustomThemesEntity>> getAvailableThemes();
}
