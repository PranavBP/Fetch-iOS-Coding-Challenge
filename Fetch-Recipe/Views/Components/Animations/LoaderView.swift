//
//  LoaderView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/8/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
                .foregroundStyle(.pink)
                .controlSize(.large)
                .padding()
        }
    }
}

#Preview {
    LoaderView()
}
