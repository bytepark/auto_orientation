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
    [self setOrientaion:call.method];
    
    [UIViewController attemptRotationToDeviceOrientation];
    
    result(FlutterMethodNotImplemented);
}

- (void)setOrientaion:(NSString *)orientation {
    if (@available(iOS 16.0, *)) {
        NSArray *scenes = [[[UIApplication sharedApplication] connectedScenes] allObjects];
        UIWindowScene *scene = [scenes firstObject];
        
        UIInterfaceOrientationMask orientaionMask = UIInterfaceOrientationMaskAll;
        
        if ([@"setLandscapeRight" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskLandscapeRight;
        }
        
        if ([@"setLandscapeLeft" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskLandscapeLeft;
        }
        
        if ([@"setPortraitUp" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskPortrait;
        }
        
        if ([@"setPortraitDown" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskPortraitUpsideDown;
        }
        
        if ([@"setPortraitAuto" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskPortrait;
        }
        
        if ([@"setLandscapeAuto" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskLandscape;
        }
        
        if ([@"setAuto" isEqualToString:orientation]) {
            orientaionMask = UIInterfaceOrientationMaskAll;
        }
        
        
        UIWindowSceneGeometryPreferencesIOS *geometryPerferencesIOS = [[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations: orientaionMask];
        [scene requestGeometryUpdateWithPreferences:geometryPerferencesIOS errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"kingiol error: %@", error);
        }];
        
    } else {
        if ([@"setLandscapeRight" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
        }
        
        if ([@"setLandscapeLeft" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
        }
        
        if ([@"setPortraitUp" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
        }
        
        if ([@"setPortraitDown" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortraitUpsideDown) forKey:@"orientation"];
        }
        
        if ([@"setPortraitAuto" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
        }
        
        if ([@"setLandscapeAuto" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
        }
        
        if ([@"setAuto" isEqualToString:orientation]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationUnknown) forKey:@"orientation"];
        }
    }
}

@end
