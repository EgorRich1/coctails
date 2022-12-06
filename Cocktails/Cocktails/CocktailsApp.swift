//
//  CocktailsApp.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

@main
struct CocktailsApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TabView {
                CocktailsListView()
                    .tabItem {
                        Label("Cocktails", image: "list_tab")
                    }
                FavoiriteCocktailsListView()
                    .tabItem {
                        Label("Favorite cocktails", image: "favorite_tab")
                    }
//                View()
//                    .tabItem {
//                        Label("Search cocktails", image: "search_tab")
//                    }
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
