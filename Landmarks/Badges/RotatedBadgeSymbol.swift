//  RotatedBadgeSymbol.swift
//  Landmarks
//  Created by Adam West on 23.12.2023.

import SwiftUI

struct RotatedBadgeSymbol: View {
    // MARK: Public Properties
    let angle: Angle
    
    // MARK: Lifecycle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
