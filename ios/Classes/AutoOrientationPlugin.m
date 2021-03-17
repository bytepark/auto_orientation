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
    if ([@"setLandscapeRight" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    }
    
    if ([@"setLandscapeLeft" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
    }
    
    if ([@"setPortraitUp" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
    }
    
    if ([@"setPortraitDown" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortraitUpsideDown) forKey:@"orientation"];
    }
    
    if ([@"setPortraitAuto" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
    }
    
    if ([@"setLandscapeAuto" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    }
    
    if ([@"setAuto" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
    }

    if ([@"setAutoButUpsideDown" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationMaskAllButUpsideDown) forKey:@"orientation"];
    }

    [UIViewController attemptRotationToDeviceOrientation];

  result(FlutterMethodNotImplemented);
}

@end
