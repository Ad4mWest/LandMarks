//  FavoriteButton.swift
//  Landmarks
//  Created by Adam West on 23.12.2023.

import SwiftUI

struct FavoriteButton: View {
    // MARK: Public Properties
    @Binding var isSet: Bool
    
    // MARK: Lifecycle
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite",
                  systemImage: isSet ? "star.fill" : "star")
            .labelStyle(.iconOnly)
            .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
