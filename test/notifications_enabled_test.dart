import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notifications_enabled/notifications_enabled.dart';
import 'package:quiver/core.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.github.jonyas/notifications_enabled');

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('should return empty optional if channel returns null', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
    expect(await NotificationsEnabled.notificationsEnabled, Optional.absent());
  });

  test('should return optional with true if channel returns true', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
    expect(await NotificationsEnabled.notificationsEnabled, Optional.of(true));
  });

  test('should return optional with false if channel returns false', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return false;
    });
    expect(await NotificationsEnabled.notificationsEnabled, Optional.of(false));
  });
}
