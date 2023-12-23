//  LandmarkRow.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
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

//#Preview("Turtle Rock") { // Можно указывать названия превью
//    Group { // Совмещать слои представления 
//        LandmarkRow(landmark: landmarks[0])
//        LandmarkRow(landmark: landmarks[1])
//    }
//}
