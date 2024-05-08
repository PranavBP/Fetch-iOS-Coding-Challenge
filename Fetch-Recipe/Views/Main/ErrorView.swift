//
//  ErrorView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/8/24.
//

import SwiftUI

struct ErrorView: View {
    
    let errorString: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Error")
                .subTitleStyle()
                .foregroundStyle(.red)
            
            Text(errorString)
                .bodyTextStyle(isBold: true)
                .foregroundStyle(.red)
                .padding()
            
            Button(action: action) {
                Text("Reload")
                    .bodyTextStyle(isBold: true)
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
            }
        }
    }
}

