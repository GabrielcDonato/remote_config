part of 'custom_theme_cubit.dart';

sealed class CustomThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CustomThemeInitial extends CustomThemeState {
  CustomThemeInitial();
}

final class CustomThemeLoading extends CustomThemeState {
  CustomThemeLoading();
}

final class CustomThemeError extends CustomThemeState {
  CustomThemeError();
}

final class CustomThemeSuccess extends CustomThemeState {
  final CustomThemesEntity customThemesEntity;

  CustomThemeSuccess({required this.customThemesEntity});
}
