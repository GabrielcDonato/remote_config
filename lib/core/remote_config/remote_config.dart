import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:remote_config/core/remote_config/exceptions/remote_config_exception.dart';

class RemoteConfig {
  final FirebaseRemoteConfig _remoteConfig;
  RemoteConfig({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;
  Future<void> remoteConfigActivate() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  Map<String, dynamic> getJson({required String param}) {
    try {
      final result = _remoteConfig.getValue(param);
      return jsonDecode(result.asString());
    } on Exception catch (e, s) {
      throw RemoteConfigException(
        error: e,
        stackTrace: s,
        message: e.toString(),
      );
    }
  }

  bool getBool({required String param}) {
    try {
      return _remoteConfig.getBool(param);
    } on Exception catch (e, s) {
      throw RemoteConfigException(
        error: e,
        stackTrace: s,
        message: e.toString(),
      );
    }
  }
}
