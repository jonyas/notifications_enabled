import Flutter
import UIKit
import UserNotifications

public class SwiftNotificationsEnabledPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.github.jonyas/notifications_enabled", binaryMessenger: registrar.messenger())
    let instance = SwiftNotificationsEnabledPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "getNotificationsEnabled":
          let current = UNUserNotificationCenter.current()

          current.getNotificationSettings(completionHandler: { (settings) in
              if settings.authorizationStatus == .notDetermined {
                  result(nil)
              } else if settings.authorizationStatus == .denied {
                  result(false)
              } else if settings.authorizationStatus == .authorized {
                  result(true)
              }
          })
        default:
          result(FlutterMethodNotImplemented)
        }
  }
}
