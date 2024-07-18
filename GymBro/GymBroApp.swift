//
//  GymBroApp.swift
//  GymBro
//
//  Created by Stefan Agusto Hutapea on 12/07/24.
//

import SwiftUI
import SwiftData

@main
struct GymBroApp: App {
    @StateObject private var viewModel = TrainingWeightViewModel()
    
    var body: some Scene {
        WindowGroup {
            BottomNavigationView()
                .environmentObject(viewModel)
                .modelContainer(for: RecordModel.self)
        }
    }
}
