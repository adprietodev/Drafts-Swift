//
//  DraftError.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

enum DraftError: Error, LocalizedError {
    case failureLoad
    case failureDecode
    case failureEncode
    case failureSave
    case failureCreateFolder
    case failureRemoveFile
    case notFoundUUID
    case draftFolder

    var errorDescription: String? {
        switch self {
        case .failureLoad: return "Failed to load draft"
        case .failureDecode: return "Failed to decode draft data"
        case .failureEncode: return "Failed to encode draft data"
        case .failureSave: return "Failed to save draft"
        case .failureCreateFolder: return "Failed to create folder"
        case .failureRemoveFile: return "Failed to remove file"
        case .notFoundUUID: return "Draft not found with given ID"
        case .draftFolder: return "Could not access draft folder"
        }
    }
}
