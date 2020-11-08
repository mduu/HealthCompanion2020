//
//  JSONDecoder+UpperCamelCase.swift
//  HackZurich


import Foundation

struct AnyKey: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}

extension JSONDecoder.KeyDecodingStrategy {
    
    static let camelCaseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromUpperCamelCase
        return decoder
    } ()
    
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom({ (keys) -> CodingKey in
            let lastKey = keys.last!
            guard lastKey.intValue == nil else { return lastKey }
            let stringValue = lastKey.stringValue.prefix(1).lowercased() + lastKey.stringValue.dropFirst()
            guard let newKey = AnyKey(stringValue: stringValue) else { return lastKey }
            return newKey
        })
    }
}
