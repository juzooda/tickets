//
//  AppDelegate.swift
//  TicketService
//
//  Created by odajuzo@gmail.com on 02/21/2017.
//  Copyright (c) 2017 odajuzo@gmail.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupLandingViewController()
        return true
    }
    
    func setupLandingViewController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        let ticketsViewController = TicketListBuilder().build()
        let mainNavigationViewController = UINavigationController(rootViewController: ticketsViewController)
        window.rootViewController = mainNavigationViewController
    }
}

