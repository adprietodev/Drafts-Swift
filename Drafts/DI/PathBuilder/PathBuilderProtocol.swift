//
//  PathBuilderProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol PathBuilderProtocol {
    func buildDraftFileURL<T: Draftable>(for type: T.Type, context: DraftContext) throws -> URL
    func buildDraftFolderURL<T: Draftable>(for type: T.Type, context: DraftContext) throws -> URL
}
