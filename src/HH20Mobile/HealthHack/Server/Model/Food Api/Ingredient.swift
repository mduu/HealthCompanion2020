// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ingredient = try? newJSONDecoder().decode(Ingredient.self, from: jsonData)

import Foundation

// MARK: - Ingredient
struct Ingredient: Codable {
    let id: String
    let amount, grams: Double
    let unit: String
    let unitDetails: JSONNull?
    let item: Child

    enum CodingKeys: String, CodingKey {
        case id, amount, grams, unit
        case unitDetails = "unit_details"
        case item
    }
}
