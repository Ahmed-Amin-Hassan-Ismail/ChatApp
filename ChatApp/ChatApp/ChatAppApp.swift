//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ChatAppApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var delegate 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
