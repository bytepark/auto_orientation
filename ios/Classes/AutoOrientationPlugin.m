#import "AutoOrientationPlugin.h"

@implementation AutoOrientationPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"auto_orientation"
            binaryMessenger:[registrar messenger]];
  AutoOrientationPlugin* instance = [[AutoOrientationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

  [[NSNotificationCenter defaultCenter]
    addObserver:instance selector:@selector(orientationChanged:)
    name:UIDeviceOrientationDidChangeNotification
    object:[UIDevice currentDevice]];
}

UIDeviceOrientation _realDeviceOrientation = UIDeviceOrientationUnknown;
bool _ignoreNextChange;

- (void)orientationChanged:(NSNotification *)note
{
    if (_ignoreNextChange) {
        _ignoreNextChange = false;
        return;
    }
    _realDeviceOrientation = [UIDevice currentDevice].orientation;
}

- (void)forceOrientation:(UIDeviceOrientation)orientation {
    if (orientation != _realDeviceOrientation) {
        _ignoreNextChange = true;
        [[UIDevice currentDevice] setValue:@(orientation) forKey:@"orientation"];
    }
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"setLandscapeRight" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationLandscapeRight];
    }
    
    if ([@"setLandscapeLeft" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationLandscapeLeft];
    }
    
    if ([@"setPortraitUp" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationPortrait];
    }
    
    if ([@"setPortraitDown" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationPortraitUpsideDown];
    }
    
    if ([@"setPortraitAuto" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationPortrait];
    }
    
    if ([@"setLandscapeAuto" isEqualToString:call.method]) {
        [self forceOrientation:UIInterfaceOrientationLandscapeRight];
    }
    
    if ([@"setAuto" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(_realDeviceOrientation) forKey:@"orientation"];
    }

    [UIViewController attemptRotationToDeviceOrientation];

  result(FlutterMethodNotImplemented);
}

@end
