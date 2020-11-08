// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let identifier = try? newJSONDecoder().decode(Identifier.self, from: jsonData)

import Foundation

// MARK: - Identifier
struct Identifier: Codable {
    let source: Source
    let id: String
}
