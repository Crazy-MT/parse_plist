import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'parse_plist_platform_interface.dart';

/// An implementation of [ParsePlistPlatform] that uses method channels.
class MethodChannelParsePlist extends ParsePlistPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('parse_plist');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDocumentPath() async {
    final documentPath = await methodChannel.invokeMethod<String>('getDocumentPath');
    return documentPath;
  }

  @override
  Future<Map?> getPlist(String filePath) async {
    final plist = await methodChannel.invokeMethod<Map>('getPlist', {'filePath': filePath});
    return plist;
  }
}
