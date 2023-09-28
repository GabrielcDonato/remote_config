class RemoteConfigException implements Exception {
  final String? message;
  final Object? error;
  final StackTrace? stackTrace;
  RemoteConfigException({
    this.message,
    this.error,
    this.stackTrace,
  });
}
