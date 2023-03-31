import Flutter
import PianoAnalytics

class PianoAnalyticsApiImpl: NSObject, PianoAnalyticsApi {
    private let tag = "PianoAnalytics"

    func configure(collectDomain: String, siteId: Int64) throws {
        print("PianoAnalyticsApiImpl.configure \(collectDomain) \(siteId)")
        pa.setConfiguration(ConfigurationBuilder()
            .withCollectDomain(collectDomain)
            .withSite(Int(siteId))
            .build()
        )
    }

    func sendEvent(eventName: String, eventProperties: [String: String]) throws {
        print("PianoAnalyticsApiImpl.sendEvent \(eventName) \(eventProperties)")
        pa.sendEvent(Event(eventName, data: eventProperties))
    }

    func getVersion() throws -> String {
        return "IOS 1.0.0"
    }
}