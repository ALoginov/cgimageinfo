/// Image metadata dictionary keys

import ImageIO

struct Keys {
    struct ImageProperties {
        static let keys: [String: String] = [
            /// Pixel Dimensions
            kCGImagePropertyPixelWidth as String: "The number of pixels along the x-axis of the image.",
            kCGImagePropertyPixelHeight as String: "The number of pixels along the y-axis of the image.",
            kCGImagePropertyPixelFormat as String: "The format of the image’s individual pixels.",
            kCGImagePropertyDPIHeight as String: "The resolution, in dots per inch, in the y dimension.",
            kCGImagePropertyDPIWidth as String: "The resolution, in dots per inch, in the x dimension.",
            kCGImagePropertyDepth as String: "The number of bits in the color sample of a pixel.",
            /// File Size
            kCGImagePropertyFileSize as String: "The size of the image file in bytes, if known.",
            /// Image Information
            kCGImagePropertyImageCount as String: "The number of images in the file.",
            kCGImagePropertyIsIndexed as String: "A Boolean value that indicates whether the image contains indexed pixel samples.",
            kCGImagePropertyImages as String: "An array of dictionaries, each of which contains metadata for one of the images in the file.",
            kCGImagePropertyThumbnailImages as String: "An array of thumbnail images.",
            kCGImagePropertyPrimaryImage as String: "The index of the primary image in the file.",
            kCGImagePropertyOrientation as String: "The intended display orientation of the image.",
            kCGImagePropertyIsFloat as String: "A Boolean value that indicates whether the image contains floating-point pixel samples.",
            /// Color Information
            kCGImagePropertyHasAlpha as String: "A Boolean value that indicates whether the image has an alpha channel.",
            kCGImagePropertyNamedColorSpace as String: "The name of the image’s color space.",
            kCGImagePropertyProfileName as String: "The name of the optional International Color Consortium (ICC) profile embedded in the image, if known.",
            kCGImagePropertyColorModel as String: "The color model of the image, such as RGB, CMYK, grayscale, or Lab.",
            kCGImagePropertyColorModelRGB as String: "The RGB color model.",
            kCGImagePropertyColorModelGray as String: "The grayscale color model.",
            kCGImagePropertyColorModelCMYK as String: "The CMYK color model.",
            kCGImagePropertyColorModelLab as String: "A Lab color model, where color values contain the amount of light and the amounts of four human-perceivable colors.",
        ]
    }
    struct GPS {
        static let keys: [String: String] = [
            /// GPS Coordinates
            kCGImagePropertyGPSLatitudeRef as String: "An indication of whether the latitude is north or south",
            kCGImagePropertyGPSLatitude as String: "The latitude",
            kCGImagePropertyGPSLongitudeRef as String: "An indication of whether the longitude is east or west",
            kCGImagePropertyGPSLongitude as String: "The longitude",
            kCGImagePropertyGPSAltitudeRef as String: "The altitude point of reference",
            kCGImagePropertyGPSAltitude as String: "The altitude",
            kCGImagePropertyGPSHPositioningError as String: "The horizontal positioning error",
            /// Destinations
            kCGImagePropertyGPSDestLatitude as String: "The latitude of the destination point",
            kCGImagePropertyGPSDestLatitudeRef as String: "An indication of whether the latitude of the destination point is northern or southern.",
            kCGImagePropertyGPSDestLongitude as String: "The longitude of the destination point.",
            kCGImagePropertyGPSDestLongitudeRef as String: "An indication of whether the longitude of the destination point is east or west.",
            kCGImagePropertyGPSDestBearing as String: "The bearing to the destination point.",
            kCGImagePropertyGPSDestBearingRef as String: "The reference for giving the bearing to the destination point.",
            kCGImagePropertyGPSDestDistance as String: "The distance to the destination point.",
            kCGImagePropertyGPSDestDistanceRef as String: "The units for expressing the distance to the destination point.",
            /// Image Orientation
            kCGImagePropertyGPSImgDirection as String: "The direction of the image.",
            kCGImagePropertyGPSImgDirectionRef as String: "The reference for the direction of the image.",
            /// Measurement Details
            kCGImagePropertyGPSStatus as String: "The status of the GPS receiver.",
            kCGImagePropertyGPSSatellites as String: "The satellites used for GPS measurements.",
            kCGImagePropertyGPSMeasureMode as String: "The GPS measurement mode.",
            kCGImagePropertyGPSDOP as String: "The GPS DOP (data degree of precision).",
            kCGImagePropertyGPSSpeedRef as String: "The unit for expressing the GPS receiver’s speed of movement.",
            kCGImagePropertyGPSSpeed as String: "The speed of the GPS receiver’s movement.",
            kCGImagePropertyGPSTrackRef as String: "The reference for the direction of GPS receiver’s movement.",
            kCGImagePropertyGPSTrack as String: "The direction of the GPS receiver’s movement.",
            kCGImagePropertyGPSMapDatum as String: "The geodetic survey data used by the GPS receiver.",
            kCGImagePropertyGPSProcessingMethod as String: "The name of the method used to find a location.",
            kCGImagePropertyGPSAreaInformation as String: "The name of the GPS area.",
            kCGImagePropertyGPSDifferental as String: "An indication of whether differential correction is applied to the GPS receiver.",
            /// Timestamp Information
            kCGImagePropertyGPSTimeStamp as String: "The time as UTC (Coordinated Universal Time).",
            kCGImagePropertyGPSDateStamp as String: "The date and time information relative to Coordinated Universal Time (UTC).",
            /// GPS Version
            kCGImagePropertyGPSVersion as String: "The version of the GPS information."
        ]
    }
}
