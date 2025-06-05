//
//  LocalError.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

enum LocalError: Error {
    case draftFolder
    case errorCreateFolder
    case cantWrite
    case parseData
    case failureRemoveImage
    case invalidURL
    case invalidBundle
    case failureSave
    case failureLoad
    case failureEncode
    case failureDecode
    case notFoundUUID
    case failureRemoveJSONFile
    case failureRemoveFolder
}
