//
//  Codable.swift
//  HackZurich

import Foundation

extension Encodable {
    func data(using encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
    func string(using encoder: JSONEncoder = JSONEncoder()) throws -> String {
        return try String(data: encoder.encode(self), encoding: .utf8)!
    }
}
