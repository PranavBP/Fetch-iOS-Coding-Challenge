//
//  SettingsView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Version: 1.0.0")
                
                Text("Name: Pranav Bellam Prasad")
                
                Link("Email: pranav.bellam@gmail.com", destination: URL(string: "mailto:pranav.bellam@gmail.com")!)
                
                Link(destination: URL(string: "https://bellam.vercel.app/")!, label: {
                    Text("Web: https://bellam.vercel.app/")
                })
            }
            .bodyTextStyle(isBold: true)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
