#import "ParsePlistPlugin.h"
#if __has_include(<parse_plist/parse_plist-Swift.h>)
#import <parse_plist/parse_plist-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "parse_plist-Swift.h"
#endif

@implementation ParsePlistPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftParsePlistPlugin registerWithRegistrar:registrar];
}
@end
