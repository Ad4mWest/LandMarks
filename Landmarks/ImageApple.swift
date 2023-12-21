//  ImageApple.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI

struct ImageApple: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    ImageApple()
}
