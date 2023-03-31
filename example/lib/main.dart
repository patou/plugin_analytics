import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plugin_analytics/piano/analytics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int counter = 0;
  final _pluginAnalyticsPlugin = PianoAnalyticsApi();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    _pluginAnalyticsPlugin.configure("logsx.xiti.com", 12345);
    _pluginAnalyticsPlugin.sendEvent("page.display", {"page.name": "test"});

    var version = await _pluginAnalyticsPlugin.getVersion();
    print(version);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Text('Running on: $_platformVersion\n'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
                _pluginAnalyticsPlugin
                    .sendEvent("count", {"value": "$counter"});
              });
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
