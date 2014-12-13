//
//  AppDelegate.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - Attributes

    var window: UIWindow?


    //MARK: - Application Lifecycle
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let vc: ViewController = ViewController()
        if (self.window == nil) {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        self.window?.rootViewController = UINavigationController(rootViewController: vc)
        self.window?.makeKeyAndVisible()
        let apiClient = FakeAPIClient.getInstance()
        return true
    }

    func applicationDidEnterBackground(application: UIApplication) {
        LocationManager.getInstance().startMonitoringSignificantLocationChanges { (location) -> () in
            BackgroundManager.executeIfBackground({ () -> () in
                Billboarder.reportBillBoardInLocation(location)
            })
        }
    }

    func applicationDidBecomeActive(application: UIApplication) {
        LocationManager.getInstance().stopMonitoringSignificantLocationChanges()
    }
    
    //MARK: - Notifications
}

