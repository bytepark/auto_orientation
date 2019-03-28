#import "AutoOrientationPlugin.h"

@implementation AutoOrientationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"auto_orientation"
            binaryMessenger:[registrar messenger]];
  AutoOrientationPlugin* instance = [[AutoOrientationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"setLandscape" isEqualToString:call.method]) {
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
  }

  if ([@"setPortrait" isEqualToString:call.method]) {
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
  }

  result(FlutterMethodNotImplemented);
}

@end
