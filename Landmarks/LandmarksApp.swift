//  LandmarksApp.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

@main
struct LandmarksApp: App {
    // MARK: Private properties
    @State private var modelData = ModelData()
    
    // MARK: Lifecycle
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    #if os(watchOS)
       WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
       #endif
   }
}
