//
//  DraftDTOProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol Draftable: Codable, Identifiable {
    var id: UUID { get }
}
