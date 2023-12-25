//  FeatureCard.swift
//  Landmarks
//  Created by Adam West on 24.12.2023.

import SwiftUI

struct FeatureCard: View {
    // MARK: Public Properties
    var landmark: Landmark
    
    // MARK: Lifecycle
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3/2, contentMode: .fit)
}
