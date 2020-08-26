//
//  AppDelegate.swift
//  swiftTest
//
//  Created by feng on 2019/10/29.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIAlertViewDelegate {

    var window: UIWindow?
    var nav : RootNavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = RootViewController.init()
        nav = RootNavigationController.init(rootViewController: viewController)
        nav.interactivePopGestureRecognizer?.delegate = nav
        self.window?.rootViewController = nav;
        self.window?.makeKeyAndVisible();

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if url.isFileURL {
            var strPath: String = url.path
            if strPath.hasPrefix("/private") {
                strPath = String(strPath.prefix("/private".count))
            }
            let range: Range = strPath.range(of: "Inbox/")!

            if range.lowerBound != range.upperBound {
                let rePath = strPath.replacingOccurrences(of: "Inbox/", with: "")
                
                if FileManager.default.fileExists(atPath: rePath) {
                    //
                    let tip = "file is exist,rename the file?"
                    let aler: UIAlertView = UIAlertView.init(title: "", message: tip, delegate: self, cancelButtonTitle: "OK")
                    aler.tag = 100
                    aler.show()
                    
                } else {
                    let tip = "file is moved successfully, open the file?"
                    let aler: UIAlertView = UIAlertView.init(title: "", message: tip, delegate: self as! UIAlertViewDelegate, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
                    aler.tag = 101
                    aler.show()
                }
                
            }
            
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
    }


}

