//
//  AppDelegate.swift
//  Jia
//
//  Created by Will Chilcutt on 5/16/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        self.setUpViews()
        
        return true
    }
    
    private func setUpViews()
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let group = JIAGroup(withName: "Chilcutts")
        
        let listVC = JIAGroupPeopleListViewController(withGroup: group)
        
        let navController = UINavigationController(rootViewController: listVC)
        navController.navigationBar.isTranslucent = false
        
        window?.rootViewController = navController
        
        window?.makeKeyAndVisible()
    }
}

