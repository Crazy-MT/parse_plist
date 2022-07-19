import 'package:flutter_test/flutter_test.dart';
import 'package:parse_plist/parse_plist.dart';
import 'package:parse_plist/parse_plist_platform_interface.dart';
import 'package:parse_plist/parse_plist_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockParsePlistPlatform 
    with MockPlatformInterfaceMixin
    implements ParsePlistPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ParsePlistPlatform initialPlatform = ParsePlistPlatform.instance;

  test('$MethodChannelParsePlist is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelParsePlist>());
  });

  test('getPlatformVersion', () async {
    ParsePlist parsePlistPlugin = ParsePlist();
    MockParsePlistPlatform fakePlatform = MockParsePlistPlatform();
    ParsePlistPlatform.instance = fakePlatform;
  
    expect(await parsePlistPlugin.getPlatformVersion(), '42');
  });
}
