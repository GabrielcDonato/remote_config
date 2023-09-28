import 'package:get_it/get_it.dart';
import 'package:remote_config/core/injects/custom_themes_injection.dart';
import 'package:remote_config/core/injects/remote_config_injection.dart';

sealed class Injection {
  static void inject(GetIt getIt) {
    CustomThemesInjection.inject(getIt);
    RemoteConfigInjection.inject(getIt);
  }
}
