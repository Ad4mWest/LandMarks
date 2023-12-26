//  NotificationView.swift
//  WatchLandmarks Watch App
//  Created by Adam West on 25.12.2023.

import SwiftUI

struct NotificationView: View {
    // MARK: Public Properties
    var title: String?
    var message: String?
    var landmark: Landmark?

    // MARK: Lifecycle
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
                .font(.headline)

            Divider()

            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView()
}

#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0])
}
