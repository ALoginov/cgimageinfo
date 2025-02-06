//
//  ImageMapView.swift
//  ImageMetadataUI
//
//  Created by aloginov on 05.02.2025.
//

import SwiftUI
import MapKit

struct MapCoordinates: Equatable {
    var latitude: Double
    var longitude: Double
}

struct ImageMapView: View {
    @State private var position: MapCameraPosition = .automatic
    @Binding var coordinates: MapCoordinates?
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                if let coordinates = coordinates {
                    Marker("Image origin", coordinate: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude))
                        .annotationTitles(.visible)
                }
            }
            .blur(radius: coordinates == nil ? 10 : 0)
            
            if coordinates == nil {
                Text("Coordinates are not provided")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(width: 400, height: 400)
            }
        }
        .onChange(of: coordinates, initial: true) { oldValue, newValue in
            guard let coordinates = newValue else { return }
            position = .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: coordinates.latitude,
                        longitude: coordinates.longitude),
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.1,
                            longitudeDelta: 0.1
                        )
                )
            )
        }
    }
}

#Preview("Empty") {
    ImageMapView(coordinates: .constant(nil))
}

#Preview("Point") {
    ImageMapView(coordinates: .constant(MapCoordinates(latitude: 55.751244, longitude: 37.618423)))
}

