//  CurcleImage.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

struct CurcleImage: View {
    var image: Image
    
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
