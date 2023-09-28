import 'package:remote_config/features/custom_themes/data/model/custom_themes_model.dart';
import 'package:remote_config/core/remote_config/exceptions/remote_config_exception.dart';
import 'package:remote_config/core/remote_config/remote_config.dart';

import 'custom_theme_datasource.dart';

class CustomThemeDatasourceImpl implements CustomThemeDatasource {
  final RemoteConfig _remoteConfig;

  CustomThemeDatasourceImpl({required RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  @override
  CustomThemesModel getAvailableThemes() {
    try {
      final result = _remoteConfig.getBool(param: 'server_off');
      // return CustomThemesModel.fromMap(result);

      return CustomThemesModel(customThemes: []);
    } catch (e, s) {
      throw RemoteConfigException(
        message: 'Erro ao buscar o tema',
        error: e,
        stackTrace: s,
      );
    }
  }
}
