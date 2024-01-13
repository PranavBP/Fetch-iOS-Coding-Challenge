//
//  DessertCardView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct DessertCardView: View {
    
    var dessert: Dessert
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75, alignment: .center)
                    .foregroundColor(.black.opacity(0.8))
                    .shadow(color: .gray, radius: 3.0)
            }
            
            Spacer()
            
            Text(dessert.strMeal)
                .bold()
                .font(.system(size: 13))
                .foregroundStyle(.black)
            
            Spacer()
        }
        .frame(width: 175, height: 215, alignment: .top)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .shadow(color: .black.opacity(0.7), radius: 10)
    }
}

#Preview {
    DessertCardView(dessert: Dessert(strMeal: "Apple & Blackberry Crumble",
                                     strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                                     idMeal: "52893"))
}
