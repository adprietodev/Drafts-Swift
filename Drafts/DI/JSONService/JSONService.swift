//
//  JSONService.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class JSONService: JSONServiceProtocol {
    // MARK: - Properties
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    // MARK: - Init
    init(encoder: JSONEncoder = .init(), decoder: JSONDecoder = .init()) {
        self.encoder = encoder
        self.decoder = decoder
    }
    // MARK: - Functions
    func encode<T>(_ value: T) throws -> Data where T : Decodable, T : Encodable {
        do {
            return try encoder.encode(value)
        } catch {
            throw DraftError.failureEncode
        }
    }
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable, T : Encodable {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            DraftLogger.error("Failed to decode \(String(describing: type)): \(error.localizedDescription))")
            throw DraftError.failureDecode
        }
    }
}
