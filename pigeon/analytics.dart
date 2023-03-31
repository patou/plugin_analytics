import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/piano/analytics.dart',
  kotlinOut:
      'android/src/main/kotlin/com/zenika/plugin_analytics/PianoAnalyticsApi.kt',
  kotlinOptions: KotlinOptions(package: 'com.zenika.plugin_analytics'),
  swiftOut: 'ios/Classes/PianoAnalyticsApi.swift',
))
@HostApi()
abstract class PianoAnalyticsApi {
  void configure(String collectDomain, int siteId);

  void sendEvent(String eventName, Map<String, String> eventProperties);

  String getVersion();
}
