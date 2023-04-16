//
//  TrackPayApp.swift
//  TrackPay WatchKit Extension
//
//  Created by Zach Fauser on 2022-07-24.
//

import SwiftUI

@main
struct TrackPayApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
