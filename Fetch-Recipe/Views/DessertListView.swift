//
//  DessertView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct DessertListView: View {
    
    @StateObject var viewModel = DessertListViewVM()
    @State var selectedDessert: Dessert? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 170, maximum: 250), spacing: 0)], spacing: 16) {
                        ForEach(viewModel.desserts) { dessert in
                            DessertCardView(dessert: dessert)
                                .onTapGesture {
                                    selectedDessert = dessert
                                }
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Desserts")
                .sheet(item: $selectedDessert) { dessert in
                    DessertDetailView(idMeal: dessert.id)
                }
            }
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    DessertListView()
}
