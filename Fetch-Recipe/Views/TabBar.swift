//
//  TabBar.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            DessertView()
                .tabItem {
                    Label("Desserts", systemImage: "fork.knife.circle.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBar()
}
