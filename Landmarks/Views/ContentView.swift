//  ContentView.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

// MARK: Switcher
enum Tab {
    case featured
    case list
}

struct ContentView: View {
    // MARK: Private properties
    @State private var selection: Tab = .featured
    
    // MARK: Lifecycle
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                Label("Featured", systemImage: "star")
            }
                .tag(Tab.featured)
                
            LandmarkList()
                .tabItem {
                Label("List", systemImage: "list.bullet")
                        
            }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
