//
//  studentDoListApp.swift
//  studentDoList
//
//  Created by Joshua on 30/1/2024.
//
import FirebaseCore
import SwiftUI

@main
struct studentDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
