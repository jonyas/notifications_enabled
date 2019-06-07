import 'dart:async';

import 'package:flutter/services.dart';
import 'package:quiver/core.dart';

class NotificationsEnabled {
  static const MethodChannel _channel = const MethodChannel('com.github.jonyas/notifications_enabled');

  static Future<Optional<bool>> get notificationsEnabled async {
    final bool notificationsEnabled = await _channel.invokeMethod('getNotificationsEnabled');
    return Optional.fromNullable(notificationsEnabled);
  }
}
