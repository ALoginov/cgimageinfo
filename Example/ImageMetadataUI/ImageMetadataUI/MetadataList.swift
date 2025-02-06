//
//  MetadataList.swift
//  ImageMetadataUI
//
//  Created by aloginov on 06.02.2025.
//

import SwiftUI
import cgimageinfo 

struct MetadataList: View {
    var metadata: Metadata
    
    var body: some View {
        List {
            ForEach(metadata.categories) { category in
                Section(category.description) {
                    ForEach(category.items) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(item.id)
                                    .font(.headline)
                                Spacer()
                                Text(item.value)
                                    .font(.subheadline)
                            }
                            Text(item.description)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MetadataList(metadata: Metadata(categories: [
        Metadata.Category(key: "gps", type: .gps, description: "GPS Data", items: [
            .init(key: "Latitude", description: "Latitude", value: "0.37"),
            .init(key: "Longitude", description: "Longitude", value: "57.38"),
            .init(key: "LatitudeRef", description: "Latitude Reference", value: "S"),
            .init(key: "LongitudeRef", description: "Longitude Reference", value: "E"),
        ]),
        Metadata.Category(key: "exif", type: .exif, description: "EXIF Data", items: [
            .init(key: "Model", description: "Camera Model", value: "iPhone 13"),
        ])
    ]))
}
