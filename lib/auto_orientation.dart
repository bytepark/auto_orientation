import 'dart:io';

import 'package:flutter/services.dart';

// Class that provides different modes
// to rotate the device programmatically either landscape or portrait
class AutoOrientation {
  static const MethodChannel _channel = const MethodChannel('auto_orientation');

  // rotate the device to landscape left mode
  static landscapeLeftMode() async {
    if (Platform.isAndroid) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }
    try {
      await _channel.invokeMethod('setLandscapeLeft');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape right mode
  static landscapeRightMode() async {
    if (Platform.isAndroid) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    }
    try {
      await _channel.invokeMethod('setLandscapeRight');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait up mode
  static portraitUpMode() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    try {
      await _channel.invokeMethod('setPortraitUp');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait down mode
  static portraitDownMode() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    try {
      await _channel.invokeMethod('setPortraitDown');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait auto mode
  static portraitAutoMode({bool forceSensor = false}) async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    try {
      await _channel
          .invokeMethod('setPortraitAuto', {'forceSensor': forceSensor});
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape auto mode
  static landscapeAutoMode({bool forceSensor = false}) async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    try {
      await _channel
          .invokeMethod('setLandscapeAuto', {'forceSensor': forceSensor});
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape auto mode
  static fullAutoMode() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    try {
      await _channel.invokeMethod('setAuto');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape auto mode
  static fullAutoButUpsideDownMode() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    try {
      await _channel.invokeMethod('setAutoButUpsideDown');
    } on MissingPluginException catch (_) {
      return;
    }
  }
}
