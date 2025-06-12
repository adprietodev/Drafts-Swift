//
//  ImagesContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ImagesContainer {
    func makeUseCase() -> ImageUseCase {
        let fileSystemService = FileSystemService()
        let imagePathBuilder = ImagePathBuilder(fileSystemService: fileSystemService)
        let localDataSource = LocalImagesDataSource(fileSystemService: fileSystemService, pathBuilder: imagePathBuilder)
        let repository = ImagesRepository(localDataSource: localDataSource)
        return ImageUseCase(repository: repository)
    }
}
