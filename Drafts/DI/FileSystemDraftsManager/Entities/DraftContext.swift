//
//  DraftContext.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct DraftContext {
    let userID: Int?

    init(userID: Int? = nil) {
        self.userID = userID
    }

    var isUserSpecific: Bool {
        return userID != nil
    }
}
