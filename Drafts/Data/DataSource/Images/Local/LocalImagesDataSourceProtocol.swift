//
//  LocalImagesDataSourceProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol LocalImagesDataSourceProtocol {
    func buildImagePath(_ image: Data?, in folderURL: URL, with name: String, imageExtension: Constants.Image.Extension) throws -> String
    func loadImage(with path: String?) throws -> Data?
    func removeImage(with path: String?) throws
    func removeImageFolder(_ folder: URL) throws
}
