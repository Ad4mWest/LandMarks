//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Adam West on 24.12.2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        Text(categoryName)
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { landmark in
                    NavigationLink {
                        LandmarkDetail(
                            landmark: landmark,
                            image: landmark.image,
                            coordinate: landmark.locationCoordinate,
                            textTitleModel: TextTitleModel(
                                name: landmark.name,
                                place: landmark.park,
                                state: landmark.state),
                            textSubtitleModel:
                                TextSubtitleModel(
                                    name: landmark.name,
                                    description: landmark.description))
                    } label: {
                        CategoryItem(landmark: landmark)
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
