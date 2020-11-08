// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let foodData = try? newJSONDecoder().decode(FoodData.self, from: jsonData)

import Foundation

// MARK: - FoodData
struct FoodData: Codable {
    let items: [ItemElement]
}
