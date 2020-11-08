// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let serving = try? newJSONDecoder().decode(Serving.self, from: jsonData)

import Foundation

// MARK: - Serving
struct Serving: Codable {
    let amount: Double
    let unit: Unit
    let grams: Double
    let details: String?
}
