//
//  ImageDropView.swift
//  ImageMetadataUI
//
//  Created by aloginov on 04.02.2025.
//

import SwiftUI

struct ImageDropView: View {
    @Binding var selectedImage: Data?
    
    var body: some View {
        ZStack {
            if let imageData = selectedImage, let image = NSImage(data: imageData) {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400, maxHeight: 400)
            } else {
                Text("Drag and drop an image here")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(width: 400, height: 400)
                    .border(Color.gray, width: 2)
            }
        }
        .dropDestination(for: URL.self) { urls, _ in
            // let nsImage = NSImage(contentsOf: url)
            if let url = urls.first, let data = try? Data(contentsOf: url) {
                self.selectedImage = data
            }
            return true
        }
    }
}

#Preview {
    ImageDropView(selectedImage: .constant(nil))
        .frame(width: 500, height: 500)
        .padding()
}
