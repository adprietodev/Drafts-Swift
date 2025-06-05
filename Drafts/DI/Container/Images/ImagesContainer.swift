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
        let localDataSource = LocalImagesDataSource()
        let repository = ImagesRepository(localDataSource: localDataSource)
        return ImageUseCase(repository: repository)
    }
}
