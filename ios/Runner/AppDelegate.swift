import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let platformInfoChannel = FlutterMethodChannel(name: "platform_info", binaryMessenger: controller.binaryMessenger)

    platformInfoChannel.setMethodCallHandler { [weak self] (call, result) in
      if call.method == "getIOSVersion" {
        let iosVersion = UIDevice.current.systemVersion
        result(iosVersion)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

