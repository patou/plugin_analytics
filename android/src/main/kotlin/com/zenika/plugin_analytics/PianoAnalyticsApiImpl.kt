package com.zenika.plugin_analytics

import android.content.Context
import android.util.Log
import io.piano.analytics.Configuration
import io.piano.analytics.Event

import io.piano.analytics.PianoAnalytics
import java.util.*


class PianoAnalyticsApiImpl(context: Context) : PianoAnalyticsApi {
    private val tag = "PianoAnalytics"
    private val pa: PianoAnalytics

    init {
        pa = PianoAnalytics.getInstance(context)
    }


    override fun configure(collectDomain: String, siteId: Long) {
        Log.d(tag,"configure: $collectDomain $siteId")
        pa.setConfiguration(
            Configuration.Builder().withCollectDomain(collectDomain).withSite(siteId.toInt())
                .build()
        )
    }

    override fun sendEvent(eventName: String, eventProperties: Map<String, String>) {
        Log.d(tag,"sendEvent: $eventName $eventProperties")
        pa.sendEvent(Event(eventName, Collections.unmodifiableMap<String, Any>(eventProperties)))

    }

    override fun getVersion(): String {
        return "1.0.0"
    }
}