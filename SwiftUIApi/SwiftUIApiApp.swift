//
//  SwiftUIApiApp.swift
//  SwiftUIApi
//
//  Created by  inna on 29/12/2020.
//

import SwiftUI
import CoreRealm


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("SwiftUIAppNavAppApp application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")


    return true
  }
}


@main
struct SwiftUICombineAppApp: App {
    
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  @Environment(\.scenePhase) var scenePhase
  
  init() {
    print("1. SwiftUIAppNavApp application is starting up. App initialiser.")
  }
  
  var body: some Scene {
    WindowGroup {
        RootView()
            .environmentObject(AirlineListViewModel())
    }
    .onChange(of: scenePhase) { newScenePhase in
      switch newScenePhase {
      case .active:
        print("2. App is active")
      case .inactive:
        print("3. App is inactive")
      case .background:
        print("4. App is in background")
      @unknown default:
        print("5. Oh - interesting: I received an unexpected new value.")
      }
    }
  }
}
