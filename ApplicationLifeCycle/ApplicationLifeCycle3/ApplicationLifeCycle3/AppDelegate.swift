//
//  AppDelegate.swift
//  ApplicationLifeCycle3
//
//  Created by Nagarajan on 8/28/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        let controller = ViewController()
        self.window?.rootViewController = controller
        
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let controller : ViewController? = self.window?.rootViewController  as? ViewController
        if let controllerObj = controller {
            let values : NSArray = [controllerObj.question?.text ?? "", controllerObj.answer?.text ?? ""]
            values.write(toFile: saveFilePath() as String, atomically: true)
        } else{
            return
        }
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        writeToControllerIfFileExists()
    }

    func writeToControllerIfFileExists(){
        let filePath : NSString = saveFilePath()
        let fileExists : Bool = FileManager.default.fileExists(atPath: filePath as String)
        if(fileExists)
        {
            let value : NSArray? = NSArray(contentsOfFile: filePath as String)
            if let arrayObj = value {
                if(arrayObj.count > 0){
                    let controller : ViewController? = self.window?.rootViewController as? ViewController
                    controller?.question?.text = arrayObj.object(at: 0) as? String ?? ""
                    controller?.answer?.text = arrayObj.object(at: 1) as? String ??
                        ""
                }
            }
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        writeToControllerIfFileExists()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func saveFilePath() -> NSString
    {
        let path : NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
        if let firstPathComponent = path[0] as? String {
            return (firstPathComponent + "saveFile.plist") as NSString
            // Use filePath safely here
        } else {
            // Handle the case where path[0] is not a String
            return "saveFile.plist"
        }
       
    }

}

