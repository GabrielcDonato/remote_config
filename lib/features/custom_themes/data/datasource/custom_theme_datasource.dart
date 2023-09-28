import 'package:remote_config/features/custom_themes/data/model/custom_themes_model.dart';

abstract interface class CustomThemeDatasource {
  CustomThemesModel getAvailableThemes();
}
