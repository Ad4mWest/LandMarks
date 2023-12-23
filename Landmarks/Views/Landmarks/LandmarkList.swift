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
        }.animation(.default)
    }
}

#Preview {
    let modelData = ModelData()
    
    return LandmarkList()
        .environment(modelData)
}

//        List(landmarks, id: \.id) { landmark in // Если модель не Identifieble можно указать ее параметр который соответсвует протоколу и итерирровать
//            LandmarkRow(landmark: landmark)
//        }
//        List { // Можно создать список и туда помещать элементы
//           LandmarkRow(landmark: landmarks[0])
//           LandmarkRow(landmark: landmarks[1])
//        }
