// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nutritionFact = try? newJSONDecoder().decode(NutritionFact.self, from: jsonData)

import Foundation

// MARK: - NutritionFact
struct NutritionFact: Codable {
    let id, item: String
    let nutrition: [String: Double]

    enum CodingKeys: String, CodingKey {
        case id, item
        case nutrition
    }
}
