//
//  DessertCardView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct DessertCardView: View {
    
    var dessert: Meal
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Dessert Image
            AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                PlaceholderImageView()
            }
            
            // MARK: - Dessert Name
            
            VStack {
                Text(dessert.strMeal)
                    .bodyTextStyle(isBold: true)
                    .foregroundStyle(.white)
                    .padding(4.0)
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .padding(.horizontal, 12.0)
            .background(
                LinearGradient(
                    colors: [Color.clear, Color.black],
                    startPoint: .top,
                    endPoint: .bottom)
            )
        }
        .frame(width: 175, height: 215, alignment: .top)
        .clipShape(RoundedRectangle(cornerRadius: 18.0, style: .continuous))
        .shadow(color: .black.opacity(0.7), radius: 10)
    }
}

#Preview {
    Group {
        DessertCardView(dessert: Meal(strMeal: "Apple & Blackberry Crumble",
                                      strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                                      idMeal: "52893"))
        
        DessertCardView(dessert: Meal(strMeal: "Banana Pancakes",
                                      strMealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                                      idMeal: "52855"))
    }
}
