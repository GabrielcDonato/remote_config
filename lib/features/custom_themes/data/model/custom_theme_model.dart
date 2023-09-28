import 'package:remote_config/features/custom_themes/domain/entities/custom_theme_entity.dart';

class CustomThemeModel extends CustomThemeEntity {
  CustomThemeModel({required super.id});

  factory CustomThemeModel.fromMap(Map<String, dynamic> map) {
    return CustomThemeModel(
      id: map['id'] as int,
      // name: map['name'] as String? ?? map['nome'],
      // colors: CustomColorsModel.fromMap(map['colors'] as Map<String, dynamic>),
      // newTheme: map['newTheme'],
      // theme: Themes.getByType(
      //   value: map['theme'],
      // ),
      // description: map['description'],
    );
  }
}
