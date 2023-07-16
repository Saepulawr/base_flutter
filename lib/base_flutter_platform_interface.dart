import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_flutter_method_channel.dart';

abstract class BaseFlutterPlatform extends PlatformInterface {
  /// Constructs a BaseFlutterPlatform.
  BaseFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseFlutterPlatform _instance = MethodChannelBaseFlutter();

  /// The default instance of [BaseFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseFlutter].
  static BaseFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseFlutterPlatform] when
  /// they register themselves.
  static set instance(BaseFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
