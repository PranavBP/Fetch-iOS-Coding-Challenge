//
//  CircularCloseButton.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct CircularCloseButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 25, height: 25)
                .padding()
        }
    }
}

#Preview {
    CircularCloseButton()
}
