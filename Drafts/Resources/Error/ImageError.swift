//
//  ImageError.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

enum ImageError: Error, LocalizedError {
    case emptyImageData
    case cantWrite
    case parseData
    case failureRemoveImage
    case failureRemoveFolder
    case invalidPath
    case folderNotFound

    var errorDescription: String? {
        switch self {
        case .emptyImageData: return "Image data is empty"
        case .cantWrite: return "Cannot write image to disk"
        case .parseData: return "Cannot parse image data"
        case .failureRemoveImage: return "Failed to remove image"
        case .failureRemoveFolder: return "Failed to remove folder"
        case .invalidPath: return "Invalid image path"
        case .folderNotFound: return "Folder not found"
        }
    }
}
