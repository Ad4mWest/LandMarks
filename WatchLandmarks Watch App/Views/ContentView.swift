//  ContentView.swift
//  WatchLandmarks Watch App
//  Created by Adam West on 25.12.2023.

import SwiftUI
import UserNotifications

struct ContentView: View {
    // MARK: Lifecycle
    var body: some View {
        LandmarkList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
