import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config/core/remote_config/remote_config.dart';

sealed class RemoteConfigInjection {
  static void inject(GetIt getIt) {
    getIt.registerLazySingleton<FirebaseRemoteConfig>(
        () => FirebaseRemoteConfig.instance);
    getIt.registerLazySingleton<RemoteConfig>(
        () => RemoteConfig(remoteConfig: getIt()));
  }
}
