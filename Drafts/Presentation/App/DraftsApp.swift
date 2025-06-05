//
//  Drafts
//
//  DraftsApp.swift
//
//  Created by Rudo Apps on 7/4/25
//

import SwiftUI

@main
struct DraftsApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
