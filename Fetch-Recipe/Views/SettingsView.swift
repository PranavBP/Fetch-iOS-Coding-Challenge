//
//  SettingsView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Version: 1.0.0")
                
                Text("Name: Pranav Bellam Prasad")
                
                Link("Email: bellam.pranav@gmail.com", destination: URL(string: "mailto:bellam.pranav@gmail.com")!)
                
                Link(destination: URL(string: "https://bellam.vercel.app/")!, label: {
                    Text("Web: https://bellam.vercel.app/")
                })
            }
            .font(.custom("Avenir-Medium", size: 18.0))
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
