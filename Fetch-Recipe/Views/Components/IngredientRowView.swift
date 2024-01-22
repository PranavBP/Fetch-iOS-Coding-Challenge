//
//  IngredientRowView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/16/24.
//

import SwiftUI

struct IngredientRowView: View {
    
    var ingredient: Ingredient
    @State var ingredientAvailable: Bool = false
    
    var body: some View {
        HStack {
            toggleButton(isChecked: $ingredientAvailable)
            
            Text(ingredient.name)
                .padding(.leading, 7.0)
            
            Spacer()
            
            Text(ingredient.measure)
                .bold()
                .foregroundStyle(.pink)
                .padding(.trailing, 7.0)
        }
        .font(.custom("Avenir", size: 14.0))
        .frame(height: 42)
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
