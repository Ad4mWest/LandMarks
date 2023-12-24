//  HikeBadge.swift
//  Landmarks
//  Created by Adam West on 24.12.2023.

import SwiftUI

struct HikeBadge: View {
    // MARK: Public Properties
    var name: String
    
    // MARK: Lifecycle
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    HikeBadge(name: "Adam")
}
