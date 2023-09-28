import 'package:dartz/dartz.dart';
import 'package:remote_config/core/failures/failures.dart';
import 'package:remote_config/features/custom_themes/domain/entities/custom_themes_entity.dart';
import 'package:remote_config/features/custom_themes/domain/repository/custom_theme_repository.dart';
import 'package:remote_config/features/custom_themes/domain/usecases/custom_theme_usecase.dart';

class CustomThemeUsecaseImpl implements CustomThemeUsecase {
  final CustomThemeRepository _customThemeRepository;
  CustomThemeUsecaseImpl({required CustomThemeRepository customThemeRepository})
      : _customThemeRepository = customThemeRepository;

  @override
  Future<Either<Failure, CustomThemesEntity>> call() =>
      _customThemeRepository.getAvailableThemes();
}
