//
//  SpottedApp.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI
import Firebase

@main
struct SpottedApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
