
import 'base_flutter_platform_interface.dart';

class BaseFlutter {
  Future<String?> getPlatformVersion() {
    return BaseFlutterPlatform.instance.getPlatformVersion();
  }
}
