// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let child = try? newJSONDecoder().decode(Child.self, from: jsonData)

import Foundation

// MARK: - Child
struct Child: Codable {
    let displayName: String?
    let id, name: String
    let brand: JSONNull?
    let details: String?
    let categorizations: Categorizations
    let nutritionAvailable: Bool
    let nutritionCount: Int
    let isGeneric, isPrivate: Bool

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case id, name, brand, details, categorizations
        case nutritionAvailable = "nutrition_available"
        case nutritionCount = "nutrition_count"
        case isGeneric = "is_generic"
        case isPrivate = "is_private"
    }
}
