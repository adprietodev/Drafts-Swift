//
//  JSONServiceProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol JSONServiceProtocol {
    func encode<T: Codable>(_ value: T) throws -> Data
    func decode<T: Codable>(_ type: T.Type, from data: Data) throws -> T
}
