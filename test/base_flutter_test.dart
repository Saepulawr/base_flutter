import 'package:flutter_test/flutter_test.dart';
import 'package:base_flutter/base_flutter.dart';
import 'package:base_flutter/base_flutter_platform_interface.dart';
import 'package:base_flutter/base_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseFlutterPlatform
    with MockPlatformInterfaceMixin
    implements BaseFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseFlutterPlatform initialPlatform = BaseFlutterPlatform.instance;

  test('$MethodChannelBaseFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseFlutter>());
  });

  test('getPlatformVersion', () async {
    BaseFlutter baseFlutterPlugin = BaseFlutter();
    MockBaseFlutterPlatform fakePlatform = MockBaseFlutterPlatform();
    BaseFlutterPlatform.instance = fakePlatform;

    expect(await baseFlutterPlugin.getPlatformVersion(), '42');
  });
}
