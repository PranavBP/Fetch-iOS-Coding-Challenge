//
//  IngredientRowView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct IngredientRowView: View {
    
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            ToggleButton()
            
            Text(ingredient.name)
                .bodyTextStyle(isBold: false)
                .padding(.leading, 8.0)
            
//            BodyTextView(text: ingredient.name, isBold: false)
//                .padding(.leading, 8.0)
            
            Spacer()
            
            Text(ingredient.measure)
                .bodyTextStyle(isBold: true)
//            BodyTextView(text: ingredient.measure, isBold: true)
                .foregroundStyle(.pink)
                .padding(.trailing, 8.0)
        }
        .frame(height: 52)
        .background(.regularMaterial)
        .clipShape(.capsule)
        .shadow(color: .pink.opacity(0.2), radius: 10)
    }
}

#Preview() {
    Group {
        IngredientRowView(ingredient: Ingredient(name: "Eggs", measure: "3"))
        IngredientRowView(ingredient: Ingredient(name: "Milk", measure: "500 ml"))
    }
}
