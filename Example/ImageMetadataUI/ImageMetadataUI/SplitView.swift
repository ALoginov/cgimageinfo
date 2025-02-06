//
//  SplitView.swift
//  ImageMetadataUI
//
//  Created by aloginov on 04.02.2025.
//

import SwiftUI
import cgimageinfo

import Combine // sry

// Sample: list item selection -> sublist for item
// Image: image selection -> data for image

class MetadataStore: ObservableObject {
    private var info = ImageInfo()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var metadata: Metadata? = nil
    @Published var imageData: Data? = nil
    @Published var coordinates: MapCoordinates? = nil
    
    init() {
        $imageData
            .sink { newValue in
                if let newValue = newValue {
                    self.imageSelected(newValue)
                }
            }
            .store(in: &cancellables)
    }
    
    private func imageSelected(_ newValue: Data) {
        let metadata = info.readMetadata(from: newValue)
        self.coordinates = nil
        
//        print("metadata: \(metadata)")
        
        // extract coordinates
        if let gps = metadata.categories.first(where: { $0.type == .gps }) {
            if let latitudeStr = gps.items.first(where: { $0.id == "Latitude" })?.value, let latitude = Double(latitudeStr), let longitudeStr = gps.items.first(where: { $0.id == "Longitude" })?.value, let longitude = Double(longitudeStr) {
                
                self.coordinates = MapCoordinates(latitude: latitude, longitude: longitude)
            }
        }
        
        self.metadata = metadata
    }
}

struct SplitView: View {
    @StateObject var metadataStore = MetadataStore()
    
    var body: some View {
        NavigationSplitView {
            ImageDropView(selectedImage: $metadataStore.imageData)
        } content: {
            if let metadata = metadataStore.metadata {
                MetadataList(metadata: metadata)
            } else {
                Text("No metadata available")
            }
        } detail: {
            ImageMapView(coordinates: $metadataStore.coordinates)
        }
    }
}

#Preview {
    SplitView()
}
