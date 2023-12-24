//  MapView.swift
//  Landmarks
//  Created by Adam West on 21.12.2023.

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Public Properties
    var coordinate: CLLocationCoordinate2D
    
    // MARK: Private properties
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
    
    // MARK: Lifecycle
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude:  34.011_286, longitude: -116.166_868))
}
