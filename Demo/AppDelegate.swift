//
//  AppDelegate.swift
//  Demo
//
//  Created by Luca Querella on 13/08/16.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import UIKit
import Katana


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var root: Root?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = UIViewController()
    self.window?.rootViewController?.view.backgroundColor = UIColor.white
    self.window?.makeKeyAndVisible()
    
    let view = (self.window?.rootViewController?.view)!
    let rootBounds = UIScreen.main.bounds
    
    let sideEffects = sideEffectsMiddleware(state: AppState.self, dependencies: nil)
    let actionLogger = actionLoggerMiddleware(state: AppState.self)

    let store = Store<SmartReducer<AppState>>(middlewares: [sideEffects,actionLogger])
    
    self.root = App(props: AppProps().frame(rootBounds)).root(store: store)
    self.root!.draw(container: view)
    
    
    return true
  }
}



