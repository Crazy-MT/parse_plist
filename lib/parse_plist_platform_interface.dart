import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'parse_plist_method_channel.dart';

abstract class ParsePlistPlatform extends PlatformInterface {
  /// Constructs a ParsePlistPlatform.
  ParsePlistPlatform() : super(token: _token);

  static final Object _token = Object();

  static ParsePlistPlatform _instance = MethodChannelParsePlist();

  /// The default instance of [ParsePlistPlatform] to use.
  ///
  /// Defaults to [MethodChannelParsePlist].
  static ParsePlistPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ParsePlistPlatform] when
  /// they register themselves.
  static set instance(ParsePlistPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDocumentPath() {
    throw UnimplementedError('getDocumentPath() has not been implemented.');
  }

  Future<Map?> getPlist(String filePath) {
    throw UnimplementedError('getPlist() has not been implemented.');
  }
}
