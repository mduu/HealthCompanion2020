// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let itemItem = try? newJSONDecoder().decode(ItemItem.self, from: jsonData)

import Foundation

// MARK: - ItemItem
struct ItemItem: Codable {
    let id, name: String
    let nutritionFacts: [NutritionFact]

    enum CodingKeys: String, CodingKey {
        case id, name
        case nutritionFacts = "nutrition_facts"
    }
}
