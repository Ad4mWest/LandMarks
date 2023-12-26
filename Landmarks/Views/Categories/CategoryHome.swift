//  CategoryHome.swift
//  Landmarks
//  Created by Adam West on 24.12.2023.

import SwiftUI

struct CategoryHome: View {
    // MARK: Public Properties
    @Environment(ModelData.self) var modelData
    
    // MARK: Private properties
    @State private var showingProfile = false
    
    // MARK: Lifecycle
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key,
                                        items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Prodile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile, content: {
                    ProfileHost()
                        .environment(modelData)
                })
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
