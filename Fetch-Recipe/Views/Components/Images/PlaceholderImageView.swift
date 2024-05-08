//
//  PlaceholderImageView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.on.rectangle.angled")
            .resizable()
            .scaledToFit()
            .foregroundColor(.black.opacity(0.8))
            .shadow(color: .gray, radius: 3.0)
    }
}

#Preview {
    PlaceholderImageView()
}
