//
//  HorizonMapsApp.swift
//  HorizonMaps
//

import SwiftUI
import SwiftData

@main
struct HorizonMapsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            SavedPlace.self,
        ])
        
        // Ensure iCloud capability is added to your target for CloudKit Database .automatic to work.
        let modelConfiguration = ModelConfiguration(
            schema: schema, 
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .automatic
        )

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)

        #if os(macOS)
        MenuBarExtra("HorizonMaps", systemImage: "arrow.triangle.turn.up.right.diamond.fill") {
            ContentView()
                .frame(minWidth: 400, minHeight: 600)
                .modelContainer(sharedModelContainer)
        }
        .menuBarExtraStyle(.window)
        #endif
    }
}

