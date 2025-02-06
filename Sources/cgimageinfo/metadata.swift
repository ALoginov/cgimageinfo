import Foundation

/// Image metadata
public struct Metadata {
    public enum CategoryType: String {
        case gps = "GPS"
        case imageProperties = "Image Properties"
        case exif = "EXIF"
    }
    public struct Category: Identifiable {
        public let id: String
        public let type: CategoryType
        public let description: String
        public let items: [Item]
        
        public init(key: String, type: CategoryType, description: String, items: [Item] = []) {
            self.id = key
            self.type = type
            self.description = description
            self.items = items
        }
    }
    public struct Item: Identifiable {
        public let id: String
        public let description: String
        public let value: String
        
        public init(key: String, description: String, value: String) {
            self.id = key
            self.description = description
            self.value = value
        }
    }
    
    public let categories: [Category]
    
    public init(categories: [Category]) {
        self.categories = categories
    }
}
