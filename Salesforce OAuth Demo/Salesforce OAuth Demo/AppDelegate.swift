//
//  AppDelegate.swift
//  Salesforce OAuth Demo
//
//  Created by Ashutosh Dave on 27/03/20.
//  Copyright © 2020 Ashutosh Dave. All rights reserved.
//

import UIKit
import MobileSync

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    override init() {
        super.init()
        MobileSyncSDKManager.initializeSDK()
        
        AuthHelper.registerBlock(forCurrentUserChangeNotifications: {
            
        })
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        AuthHelper.loginIfRequired {
            self.setupRootViewController()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func setupRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "RootViewController")
        let navVC = UINavigationController(rootViewController: rootVC)
        self.window?.rootViewController = navVC
    }

}

