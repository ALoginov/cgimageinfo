// cgimagetool

import cgimageinfo
import ImageIO
import Foundation

func loadCGImageFromBundle(named imageName: String) -> CGImage? {
    // Get the image path from the app bundle
    guard let imageURL = Bundle.module.url(forResource: imageName, withExtension: "jpg") else {
        print("Image not found in assets.")
        return nil
    }
    
    // Create image source
    guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, nil) else {
        print("Failed to create image source.")
        return nil
    }
    
    // Create CGImage from the source
    guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
        print("Failed to create CGImage.")
        return nil
    }
    print("Image loaded from Bundle")
    return cgImage
}

//guard let image = loadCGImageFromBundle(named: "gps_1") else {
//    fatalError("Failed to load image.")
//}

guard let imageURL = Bundle.module.url(forResource: "gps_1", withExtension: "jpg") else {
    fatalError("Image not found in assets.")
}
guard let imageData = try? Data(contentsOf: imageURL) else {
    fatalError("Failed to load image data.")
}

let tool = ImageInfo()

if let metadata = tool.extractMetadata(from: imageData) {
    // read CFDictionary
//    print(metadata)
}

let metadata = tool.readMetadata(from: imageData)
for category in metadata.categories {
    print(category.id + ": " + category.description)
    for item in category.items ?? [] {
        print("\t\(item.id): \(item.value)")
    }
}
