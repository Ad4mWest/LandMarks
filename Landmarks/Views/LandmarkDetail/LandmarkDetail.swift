//  LandmarkDetail.swift
//  Landmarks
//  Created by Adam West on 22.12.2023.

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    var image: Image
    var coordinate: CLLocationCoordinate2D
    var textTitleModel: TextTitleModel
    var textSubtitleModel: TextSubtitleModel
    
    var body: some View {
        ScrollView {
            MapView(coordinate: coordinate)
                .frame(height: 300)
            CurcleImage(image: image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(spacing: -10) {
                TextTitle(textTitleModel: textTitleModel)
                Divider()
                TextSubtitle(textSubtitleModel: textSubtitleModel)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(
        image: Image("turtlerock"),
        coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        textTitleModel: TextTitleModel(
            name: "Turtle Rock",
            place: "Joshua Tree National Park",
            state: "California"),
        textSubtitleModel: TextSubtitleModel(
                    name: "Adam",
                    description: "Descriptive text goes here.")
    )
}