//  CurcleImage.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

struct CurcleImage: View {
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
    CurcleImage(image: Image("icybay"))
}
