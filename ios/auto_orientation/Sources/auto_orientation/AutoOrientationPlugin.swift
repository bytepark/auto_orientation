import Flutter
import UIKit

public class AutoOrientationPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "auto_orientation", binaryMessenger: registrar.messenger())
        let instance = AutoOrientationPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if #available(iOS 16.0, *) {
            setOrientation(call)
        } else {
            setLegacyOrientation(call)
        }

        UIViewController.attemptRotationToDeviceOrientation()

        result(FlutterMethodNotImplemented)
    }
    
    @available(iOS 16.0, *)
    func setOrientation(_ call: FlutterMethodCall) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            else { return }
        let resolvedMask: UIInterfaceOrientationMask
        switch call.method {
        case "setLandscapeRight", "setLandscapeAuto":
            resolvedMask = UIInterfaceOrientationMask.landscapeRight
        case "setLandscapeLeft":
            resolvedMask = UIInterfaceOrientationMask.landscapeLeft
        case "setPortraitUp", "setPortraitAuto":
            resolvedMask = UIInterfaceOrientationMask.portrait
        case "setPortraitDown":
            resolvedMask = UIInterfaceOrientationMask.portraitUpsideDown
        default:
            resolvedMask = UIInterfaceOrientationMask.all
            break
        }
        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: resolvedMask)) { error in
            // TODO: Perhaps call back to Flutter with an error
        }
    }
    
    func setLegacyOrientation(_ call: FlutterMethodCall) {
        let resolvedOrientation: UIInterfaceOrientation
        switch call.method {
        case "setLandscapeRight", "setLandscapeAuto":
            resolvedOrientation = UIInterfaceOrientation.landscapeRight
        case "setLandscapeLeft":
            resolvedOrientation = UIInterfaceOrientation.landscapeLeft
        case "setPortraitUp", "setPortraitAuto":
            resolvedOrientation = UIInterfaceOrientation.portrait
        case "setPortraitDown":
            resolvedOrientation = UIInterfaceOrientation.portraitUpsideDown
        default:
            resolvedOrientation = UIInterfaceOrientation.unknown
            break
        }
        UIDevice.current.setValue(resolvedOrientation.rawValue, forKey: "orientation")
    }
}
