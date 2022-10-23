//
//  PlannetsApp.swift
//  Plannets
//
//  Created by Keshan Fernando on 2022-10-23.
//

import SwiftUI

@main
struct PlannetsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
