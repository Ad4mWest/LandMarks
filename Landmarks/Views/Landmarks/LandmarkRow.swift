//  LandmarkRow.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct LandmarkRow: View {
    // MARK: Public Properties
    var landmark: Landmark
    
    // MARK: Lifecycle
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding()
    }
}
   
#Preview("Salmon") {
    LandmarkRow(landmark: ModelData().landmarks[0])
}
