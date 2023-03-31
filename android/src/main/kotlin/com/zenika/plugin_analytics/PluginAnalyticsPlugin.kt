package com.zenika.plugin_analytics

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** PluginAnalyticsPlugin */
class PluginAnalyticsPlugin: FlutterPlugin {

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    PianoAnalyticsApi.setUp(flutterPluginBinding.binaryMessenger, PianoAnalyticsApiImpl(flutterPluginBinding.applicationContext))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }
}
