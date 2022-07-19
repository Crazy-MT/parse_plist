// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'parse_plist_platform_interface.dart';

/// A web implementation of the ParsePlistPlatform of the ParsePlist plugin.
class ParsePlistWeb extends ParsePlistPlatform {
  /// Constructs a ParsePlistWeb
  ParsePlistWeb();

  static void registerWith(Registrar registrar) {
    ParsePlistPlatform.instance = ParsePlistWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<String?> getDocumentPath() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<Map?> getPlist(String path) {
    return Future(() => Map());
  }
}
