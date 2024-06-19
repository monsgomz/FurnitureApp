//
//  FavView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-12.
//

import SwiftUI

struct FavView: View {
	@Environment(FurnitureModelView.self) var modelData
	@Binding var hideTabBar: Bool
	
    var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.fixed(175)), GridItem(.fixed(175))], spacing: 5) {
					ForEach(modelData.favorites){ item in
						NavigationLink {
							FurnitureDetail(muebleInfo: item, hideTabBar: $hideTabBar)
						} label: {
							SingleCardView(muebleInfo: item)
						}
					}
				}
			
			}
			.overlay {
				if modelData.favorites.isEmpty {
					
					ContentUnavailableView(label: {
						Label("No favorites", systemImage: "heart")
					}, description: {Text("Start adding items to see your list")
					})
					.offset(y: -60)
				}
			}
			
		}
		.navigationTitle("Favorites")
    }
}

#Preview {
	FavView(hideTabBar: .constant(false))
		.environment(FurnitureModelView())
}
