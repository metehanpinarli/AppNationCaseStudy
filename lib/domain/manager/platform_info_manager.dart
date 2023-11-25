import 'dart:io';

import 'package:flutter/services.dart';

class PlatformInfoManager {
  static const MethodChannel _channel = MethodChannel('platform_info');

  Future<String?> getOSVersion() async {
    if (Platform.isIOS) {
      return await _getIOSVersion();
    } else if (Platform.isAndroid) {
      return await _getAndroidVersion();
    } else {
      throw 'Error: Platform not supported';
    }
  }

  Future<String?> _getIOSVersion() async {
    try {
      final String version = await _channel.invokeMethod('getIOSVersion');
      return version;
    } on PlatformException catch (e) {
      return 'Error: ${e.message}';
    }
  }

  Future<String?> _getAndroidVersion() async {
    try {
      final String version = await _channel.invokeMethod('getAndroidVersion');
      return version;
    } on PlatformException catch (e) {
      return 'Error: ${e.message}';
    }
  }
}
