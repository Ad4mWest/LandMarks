//  LandmarksApp.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
