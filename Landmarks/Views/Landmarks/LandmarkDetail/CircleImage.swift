//  CircleImage.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

struct CircleImage: View {
    // MARK: Public Properties
    var image: Image
    
    // MARK: Lifecycle
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("icybay"))
}
