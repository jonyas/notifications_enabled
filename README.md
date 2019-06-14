# notifications_enabled

A Flutter plugin that checks from native side if push notifications are enabled.

## Installation

Declare a pubspec dependency in your Flutter project.

## What is it for?

It checks from native side if the app has permissions enabled/disabled for posting push notifications into user's device. In iOS it also provides information whether the permission was already requested.

## How to use it?

You can check the Example app to see a real use case on how to access the notifications enabled information. Shortly explained:

```dart
// Gets an optional checking if notifications are enabled for current app.
final Optional<bool> areNotificationsEnabled = await NotificationsEnabled.notificationsEnabled;

// Empty optional, means notification permissions were never requested
if (areNotificationsEnabled.isNotPresent) {
    // Possibly ask for permissions?
} else if (areNotificationsEnabled.value) {
    print('Notifications are enabled!');
} else {
    // Notiications are disabled
}
```
