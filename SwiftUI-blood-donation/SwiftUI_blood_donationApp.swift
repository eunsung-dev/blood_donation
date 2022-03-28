//
//  SwiftUI_blood_donationApp.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/14.
//

import SwiftUI
import Firebase
import UIKit

@main
struct SwiftUI_blood_donationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
