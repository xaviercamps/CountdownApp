//
//  CountdownApp.swift
//  Countdown
//
//  Created by Xavier Camps Novi on 24/1/21.
//

import SwiftUI

@main
struct CountdownApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
