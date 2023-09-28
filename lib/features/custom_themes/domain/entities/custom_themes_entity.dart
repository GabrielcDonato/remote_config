import 'package:remote_config/features/custom_themes/domain/entities/custom_theme_entity.dart';

class CustomThemesEntity {
  final List<CustomThemeEntity> customThemes;
  CustomThemesEntity({
    required this.customThemes,
  });

  @override
  bool operator ==(covariant CustomThemesEntity other) {
    if (identical(this, other)) return true;

    return other.customThemes == customThemes;
  }

  @override
  int get hashCode {
    return Object.hashAll(customThemes);
  }
}
