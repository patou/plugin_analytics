import Flutter

public class PluginAnalyticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      let api = PianoAnalyticsApiImpl()
      PianoAnalyticsApiSetup.setUp(binaryMessenger: registrar.messenger(), api: api)
  }
}
