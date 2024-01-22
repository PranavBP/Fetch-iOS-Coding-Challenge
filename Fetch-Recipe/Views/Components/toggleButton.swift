//
//  toggleButton.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/17/24.
//

import SwiftUI

struct toggleButton: View {
    
    @Binding var isChecked: Bool
    
    var body: some View {
        Button {
//            HapticManager.shared.impact(style: .heavy)
            HapticManager.shared.notification(type: .success)
            isChecked.toggle()
        } label: {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .frame(width: 18, height: 18)
        }
        .padding(.leading, 10.0)
    }
}

#Preview {
    toggleButton(isChecked: .constant(true))
}
