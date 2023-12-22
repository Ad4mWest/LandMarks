//  LandmarkList.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(
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
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

//        List(landmarks, id: \.id) { landmark in // Если модель не Identifieble можно указать ее параметр который соответсвует протоколу и итерирровать
//            LandmarkRow(landmark: landmark)
//        }
//        List { // Можно создать список и туда помещать элементы
//           LandmarkRow(landmark: landmarks[0])
//           LandmarkRow(landmark: landmarks[1])
//        }
