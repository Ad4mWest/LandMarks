//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Adam West on 25.12.2023.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: Public Properties
    @Environment(ModelData.self) var modelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    // MARK: Private properties
    @State private var showFavoritesOnly = false
    
    // MARK: Lifecycle
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(
                            landmark: landmark
                        )
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .padding(.vertical, -15)
                }
            }.animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
