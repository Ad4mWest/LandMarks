//  LandmarkList.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData 
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(
                            landmark: landmark, 
                            image: landmark.image,
                            coordinate: landmark.locationCoordinate,
                            textTitleModel: TextTitleModel(
                                name: landmark.name,
                                place: landmark.park,
                                state: landmark.state),
                            textSubtitleModel: TextSubtitleModel(
                                name: landmark.name,
                                description: landmark.description)
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
