//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Tim Colson on 12/6/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
