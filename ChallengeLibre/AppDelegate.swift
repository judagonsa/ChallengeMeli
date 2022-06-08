//
//  AppDelegate.swift
//  ChallengeLibre
//
//  Created by Julian González on 3/06/22.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationManager : CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request allow for location user
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        return true
    }

}

