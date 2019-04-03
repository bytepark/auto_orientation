import 'package:flutter/services.dart';

// Class that provides different modes
// to rotate the device programmatically either landscape or portrait
class AutoOrientation {
  static const MethodChannel _channel = const MethodChannel('auto_orientation');

  // rotate the device to landscape left mode
  static landscapeLeftMode() async {
    try {
      await _channel.invokeMethod('setLandscapeLeft');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape right mode
  static landscapeRightMode() async {
    try {
      await _channel.invokeMethod('setLandscapeRight');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait up mode
  static portraitUpMode() async {
    try {
      await _channel.invokeMethod('setPortraitUp');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait down mode
  static portraitDownMode() async {
    try {
      await _channel.invokeMethod('setPortraitDown');
    } on MissingPluginException catch (_) {
      return;
    }
  }
}
