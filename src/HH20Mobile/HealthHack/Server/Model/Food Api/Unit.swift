// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let unit = try? newJSONDecoder().decode(Unit.self, from: jsonData)

import Foundation

// MARK: - Unit
struct Unit: Codable {
    let id, singularName: String
    let abbreviatedSingularName: AbbreviatedName?
    let pluralName: String?
    let abbreviatedPluralName: AbbreviatedName?
    let measureType: MeasureType?
    let measureSystem: MeasureSystem?
    let granularity: Double?
    let details: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case singularName = "singular_name"
        case abbreviatedSingularName = "abbreviated_singular_name"
        case pluralName = "plural_name"
        case abbreviatedPluralName = "abbreviated_plural_name"
        case measureType = "measure_type"
        case measureSystem = "measure_system"
        case granularity, details
    }
}
