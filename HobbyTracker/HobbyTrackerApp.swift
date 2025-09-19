//
//  HobbyTrackerApp.swift
//  HobbyTracker
//
//  Created by Abim Shrestha on 9/19/25.
//

import SwiftUI

@main
struct HobbyTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
