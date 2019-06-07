#import "NotificationsEnabledPlugin.h"
#import <notifications_enabled/notifications_enabled-Swift.h>

@implementation NotificationsEnabledPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNotificationsEnabledPlugin registerWithRegistrar:registrar];
}
@end
