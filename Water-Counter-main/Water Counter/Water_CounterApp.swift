//
//  Water_CounterApp.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import SwiftUI

@main
struct Water_CounterApp: App {
    @State private var dataController = DataController();
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView{
                    HomeView()
                        .environment(\.managedObjectContext, dataController.cantainer.viewContext)
                }.tabItem {
                    Label("Home", systemImage: "house")
                }
                NavigationView{
                    HistoryView()
                        .environment(\.managedObjectContext, dataController.cantainer.viewContext)
                }.tabItem {
                    Label("History", systemImage: "clock")
                }
                NavigationView{
                    SettingsView()
                        .environment(\.managedObjectContext, dataController.cantainer.viewContext)
                }.tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            }
        }
    }
}
