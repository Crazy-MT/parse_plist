
import 'parse_plist_platform_interface.dart';

class ParsePlist {
  Future<String?> getPlatformVersion() {
    return ParsePlistPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDocumentPath() {
    return ParsePlistPlatform.instance.getDocumentPath();
  }

  Future<Map?> getPlist(String filePath) {
    return ParsePlistPlatform.instance.getPlist(filePath);
  }
}
