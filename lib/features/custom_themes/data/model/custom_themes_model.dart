import 'package:remote_config/features/custom_themes/data/model/custom_theme_model.dart';
import 'package:remote_config/features/custom_themes/domain/entities/custom_themes_entity.dart';

class CustomThemesModel extends CustomThemesEntity {
  CustomThemesModel({required super.customThemes});

  factory CustomThemesModel.fromMap(Map<String, dynamic> map) {
    return CustomThemesModel(
      customThemes: List<CustomThemeModel>.from(
        (map['custom_themes'] as List).map<CustomThemeModel>(
          (x) => CustomThemeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
