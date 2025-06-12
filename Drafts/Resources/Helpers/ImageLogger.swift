//
//  ImageLogger.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

enum ImageLogger {
    static func info(_ message: String) {
        print("⚙️ 🌁 \(message)")
    }

    static func success(_ message: String) {
        print("✅ 🌁 \(message)")
    }

    static func error(_ message: String) {
        print("❌ 🌁 \(message)")
    }

    static func warning(_ message: String) {
        print("⚠️ 🌁 \(message)")
    }
}
