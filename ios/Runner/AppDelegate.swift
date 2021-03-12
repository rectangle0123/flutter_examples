import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // GoogleマップのAPIキーをInfo.plistから取得して設定する
    let gmapsAPIKey = Bundle.main.object(forInfoDictionaryKey: "GoogleMapsAPIKey") as! String
    GMSServices.provideAPIKey(gmapsAPIKey)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
