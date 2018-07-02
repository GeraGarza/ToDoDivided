//
//  AppDelegate.swift
//  ToDoDivided
//
//  Created by Gera Garza on 6/26/18.
//  Copyright © 2018 Gera Garza. All rights reserved.
//

import UIKit
import RealmSwift
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)

        do{
        _ = try Realm()

            
        }catch{
            print(error)
        }
        return true
    }


}

