import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:remote_config/features/custom_themes/domain/entities/custom_themes_entity.dart';
import 'package:remote_config/features/custom_themes/domain/usecases/custom_theme_usecase.dart';

part 'custom_theme_state.dart';

class CustomThemeCubit extends Cubit<CustomThemeState> {
  final CustomThemeUsecase _customThemeUsecase;

  CustomThemeCubit({required CustomThemeUsecase customThemeUsecase})
      : _customThemeUsecase = customThemeUsecase,
        super(CustomThemeInitial());

  void getThemes() async {
    emit(
      CustomThemeLoading(),
    );

    final result = await _customThemeUsecase();

    result.fold(
      (failure) {
        emit(
          CustomThemeError(),
        );
      },
      (customThemesEntity) {
        emit(
          CustomThemeSuccess(customThemesEntity: customThemesEntity),
        );
      },
    );
  }
}
