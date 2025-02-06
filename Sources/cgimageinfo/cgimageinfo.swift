// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ImageIO

/// Loads image metadata from a file, or loads image from url
public final class ImageInfo {
    public init() {}
    
    /// Request metadata as proprietary `Metadata`
    public func readMetadata(from imageData: Data) -> Metadata {
        guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else {
            print("Failed to create image source.")
            return Metadata(categories: [])
        }
        guard let metadataDict = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [String: Any] else {
            print("No metadata")
            return Metadata(categories: [])
        }
        var categories: [Metadata.Category] = []
        if let imageProps = readImageProperties(from: metadataDict) {
            categories.append(imageProps)
        }
        if let gps = readGPSMetadata(from: metadataDict) {
            categories.append(gps)
        }
        return Metadata(categories: categories)
    }
    
    /// Request metadata as `CFDictionary`
    public func extractMetadata(from imageData: Data) -> CFDictionary? {
        guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else {
            print("Failed to create image source.")
            return nil
        }
        guard let metadataDict = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) else {
            print("No metadata")
            return nil
        }
        return metadataDict
    }
    
    /// Request metadata as `[String: Any]`
    public func readMetadataDictionary(from imageData: Data) -> [String: Any]? {
        guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else {
            print("Failed to create image source.")
            return nil
        }
        guard let metadataDict = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [String: Any] else {
            print("No metadata")
            return nil
        }
        return metadataDict
    }
}

//MARK: Image Properties
extension ImageInfo {
    func readImageProperties(from metadata: [String: Any]) -> Metadata.Category? {
        let categoryKey = kCGImagePropertyFileContentsDictionary as String
        var items: [Metadata.Item] = []
        for (key, description) in Keys.ImageProperties.keys {
            if let value = metadata[key] {
                items.append(Metadata.Item(key: key, description: description, value: String(describing: value)))
            }
        }
        return Metadata.Category(key: categoryKey, type: .imageProperties, description: "Image Properties", items: items)
    }
}

//MARK: GPS Metadata
extension ImageInfo {
    func readGPSMetadata(from metadata: [String: Any]) -> Metadata.Category? {
        let categoryKey = kCGImagePropertyGPSDictionary as String
        guard let gpsMetadata = metadata[kCGImagePropertyGPSDictionary as String] as? [String: Any] else {
            return nil
        }
        var items: [Metadata.Item] = []
        for (key, description) in Keys.GPS.keys {
            if let value = gpsMetadata[key] {
                items.append(Metadata.Item(key: key, description: description, value: String(describing: value)))
            }
        }
        return Metadata.Category(key: categoryKey, type: .gps, description: "GPS Metadata", items: items)
    }
    
    func extractGPSMetadata(from image: CGImage) {
        guard let imageData = image.dataProvider?.data as Data?,
              let source = CGImageSourceCreateWithData(imageData as CFData, nil),
              let metadata = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [String: Any],
              let gpsMetadata = metadata[kCGImagePropertyGPSDictionary as String] as? [String: Any] else {
            print("No GPS metadata found")
            return
        }
        
        // Extract latitude
        if let latitude = gpsMetadata[kCGImagePropertyGPSLatitude as String] as? Double,
           let latitudeRef = gpsMetadata[kCGImagePropertyGPSLatitudeRef as String] as? String,
           let longitude = gpsMetadata[kCGImagePropertyGPSLongitude as String] as? Double,
           let longitudeRef = gpsMetadata[kCGImagePropertyGPSLongitudeRef as String] as? String {
            
            let lat = latitudeRef == "N" ? latitude : -latitude
            let lon = longitudeRef == "E" ? longitude : -longitude
            
            // Extract altitude
            let altitude = gpsMetadata[kCGImagePropertyGPSAltitude as String] as? Double ?? 0.0
            let altitudeRef = gpsMetadata[kCGImagePropertyGPSAltitudeRef as String] as? Int ?? 0
            let finalAltitude = altitudeRef == 1 ? -altitude : altitude
            
            // Extract timestamp
            let timestampString = gpsMetadata[kCGImagePropertyGPSTimeStamp as String] as? String
            let dateStampString = gpsMetadata[kCGImagePropertyGPSDateStamp as String] as? String
//            let timestamp = createDate(from: dateStampString, time: timestampString)
            
//            let location = CLLocation(
//                coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon),
//                altitude: finalAltitude,
//                horizontalAccuracy: kCLLocationAccuracyBest,
//                verticalAccuracy: kCLLocationAccuracyBest,
//                timestamp: timestamp ?? Date()
//            )
        
        }
        
        print("Incomplete GPS data")
//        return nil
    }

    
}
