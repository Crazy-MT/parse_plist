import Cocoa
import FlutterMacOS

public class ParsePlistPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "parse_plist", binaryMessenger: registrar.messenger)
    let instance = ParsePlistPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getDocumentPath":
      let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map(\.path)
      result(paths.first!)
    case "getPlist":
      var listData: NSDictionary = NSDictionary()
      var path: String?
      if let args = call.arguments as? Dictionary<String, String?> {path = args["filePath"] as? String}
      listData = NSDictionary(contentsOfFile: path!)!
      result(listData)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
