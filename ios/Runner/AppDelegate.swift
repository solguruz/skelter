import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        guard let controller = window?.rootViewController as? FlutterViewController else {
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }

        let batteryChannel = FlutterMethodChannel(
            name: "com.skelter.battery/channel",
            binaryMessenger: controller.binaryMessenger
        )

        batteryChannel.setMethodCallHandler { [weak self] call, result in
            switch call.method {
            case "getBatteryLevel":
                self?.getBatteryLevel(result: result)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func getBatteryLevel(result: @escaping FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        let levelFloat = device.batteryLevel
        let level = Int(levelFloat * 100)

        if level >= 0 {
            result(level)
        } else {
            result(FlutterError(
                code: "UNAVAILABLE",
                message: "Battery level not available.",
                details: nil
            ))
        }
    }
}