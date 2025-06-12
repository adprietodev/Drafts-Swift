//
//  LocalCarDTO.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct LocalCarDTO: Draftable {
    var id: UUID
    var make: String
    var model: String
    var year: Int
    var isElectric: Bool
}
