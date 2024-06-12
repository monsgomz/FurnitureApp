//
//  ContentView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import SwiftUI

struct ContentView: View {
	
	
	var body: some View {
		
		TabView{
			
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house")
				}
				
			FavView()
				.tabItem {
					Label("Favorite", systemImage: "heart.fill")
				}
			
			ShopView()
				.tabItem {
					Label("Shop", systemImage: "cart")
				}
			
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person.circle")
				}
		}
		
		
	}
	
}

#Preview {
	ContentView()
		.environment(FurnitureModelView())
}

