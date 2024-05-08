//
//  TabBar.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            DessertListView()
                .tabItem {
                    Label("Desserts", systemImage: "fork.knife.circle.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(.pink)
    }
}

#Preview {
    TabBar()
}
