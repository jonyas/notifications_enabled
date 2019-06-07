import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notifications_enabled/notifications_enabled.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _notificationsEnabledText;

  @override
  void initState() {
    super.initState();
    initEnabledNotificationsState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initEnabledNotificationsState() async {
    String notificationsEnabledText;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final areNotificationsEnabled = await NotificationsEnabled.notificationsEnabled;
      if (areNotificationsEnabled.isNotPresent) {
        notificationsEnabledText = 'Notification permission still not requested';
      } else if (areNotificationsEnabled.value) {
        notificationsEnabledText = 'Notification enabled';
      } else {
        notificationsEnabledText = 'Notification disabled';
      }
    } on PlatformException {
      notificationsEnabledText = 'Failed to get notifications enabled.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _notificationsEnabledText = notificationsEnabledText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications enabled plugin example app'),
        ),
        body: Center(
          child: Text(
            'Notifications status : $_notificationsEnabledText\n',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
