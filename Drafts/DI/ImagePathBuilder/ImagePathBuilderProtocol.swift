//
//  ImagePathBuilderProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ImagePathBuilderProtocol {
    func buildImagePath(folderURL: URL, name: String, extensionImage: Constants.Image.Extension) -> URL
    func buildRelativePath(from absoluteURL: URL) -> String
    func buildAbsolutePath(from relativePath: String) -> URL
}
