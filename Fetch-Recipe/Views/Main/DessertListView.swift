//
//  DessertView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct DessertListView: View {
    
    @StateObject var viewModel = DessertListViewVM()
    @State var selectedDessert: Meal? = nil
    
    var body: some View {
        NavigationView {
            if let desserts = viewModel.desserts {
                ScrollView {
                    VStack {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 170, maximum: 250), spacing: 0)], spacing: 16) {
                            ForEach(desserts) { dessert in
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
            } else if let error = viewModel.error {
                ErrorView(errorString: error) {
                    viewModel.fetchData()
                }
            }
            else {
                LoaderView()
            }
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    DessertListView()
}
