//
//  ContentView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import SwiftUI

struct ContentView: View {
	@State var selectedTab = 0
	
	var body: some View {
		
		ZStack(alignment: .bottom){
			TabView(selection: $selectedTab){
				
				HomeView()
					.tag(0)
//					.tabItem {
//						Label("Home", systemImage: "house")
//					}
					.toolbar(.hidden, for: .tabBar)
					
				FavView()
					.tag(1)
//					.tabItem {
//						Label("Favorite", systemImage: "heart.fill")
//					}
					.toolbar(.hidden, for: .tabBar)
				ShopView()
					.tag(2)
//					.tabItem {
//						Label("Shop", systemImage: "cart")
//					}
				
				ProfileView()
					.tag(3)
//					.tabItem {
//						Label("Profile", systemImage: "person.circle")
//					}
					.toolbar(.hidden, for: .tabBar)
			}
			
			ZStack{
				HStack{
					ForEach((TabbedItems.allCases), id: \.self){ item in
						Button{
							selectedTab = item.rawValue
						} label: {
							CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
						}
					}
				}
				.padding(6)
			}
			.frame(height: 70)
			.background(.accent.opacity(0.6))
			.cornerRadius(35)
			.padding(.horizontal, 26)
		}
		
		
		
	}
	
	
}

#Preview {
	ContentView()
		.environment(FurnitureModelView())
}

//Para leer los valores y retornar la tabbar
extension ContentView {
	func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
		HStack(spacing: 10){
			Spacer()
			Image(systemName: imageName)
				.resizable()
				.renderingMode(.template)
				.foregroundColor(isActive ? .white : .brown)
				.frame(width: 25, height: 20)
			if isActive{
				Text(title)
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
					.foregroundColor(isActive ? .white : .accent)
			}
			Spacer()
		}
		.frame(width: isActive ? .infinity : 60, height: 60)
		.background(isActive ? .accent.opacity(1) : .clear)
		.cornerRadius(30)
	}
}
