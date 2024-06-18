//
//  HomeView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-12.
//

import SwiftUI

struct HomeView: View {
	
	@Environment(FurnitureModelView.self) var modelData
	@State var categorySelected: FurnitureData.Item.Categories = .all
	@State var searchField: String = ""
	@State var imageMueble: Int = 1
	
	var popularFurniture: [FurnitureData.Item] {
		return modelData.muebles.filter {
			$0.ventas > 1000
		}
	}
	
	var bestFurniture: [FurnitureData.Item] {
		return modelData.muebles.filter {
			$0.stars >= 4
		}
	}
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(.bg)
				ScrollView {
					VStack {
						Title()
						//MARK: Search + scan
						Search(searchField: $searchField)
						
						//MARK: Menu
						Menu()
						
						HStack {
							Text("Popular")
								.font(.custom("Plus Jakarta Sans Bold", size: 21))
							Spacer()
//							Text("\(popularFurniture.count)")
						}
						.padding(.top, 10)
						
						//MARK: Popular Card
						ScrollView(.horizontal){
							HStack {
								ForEach(popularFurniture){ item in
									CardView(muebleInfo: item)
								}
							}
						}
						
						HStack {
							Text("Best")
								.font(.custom("Plus Jakarta Sans Bold", size: 21))
							Spacer()
							
						}
						.padding(.top, 10)
						
						//MARK: Card Best
						ScrollView(.horizontal){
							HStack {
								ForEach(bestFurniture){ item in
									CardView(muebleInfo: item)
								}
							}
						}
					}
					.padding()
					.toolbar {
						ToolbarItem(placement: .topBarLeading){
//							Button("Sign In", systemImage: "arrow.up"){
								NavigationLink {
									ProfileView()
								} label: {
									Image(systemName: "line.3.horizontal.circle")
																	.resizable()
																	.foregroundStyle(.accent)
																	.scaledToFit()
																	.frame(height: 30)
								}
//							}
								.labelStyle(.iconOnly)
						}
						ToolbarItem {
							NavigationLink {
								ProfileView()
							}
						label: {
							Image(systemName: "person.circle")
								.resizable()
								.foregroundStyle(.accent)
								.scaledToFit()
								.frame(height: 30)
						}
						}
						
					}
					.toolbarBackground(.bg, for: .navigationBar)
					.toolbarBackground(.visible, for: .navigationBar)
					
				}
			}
			.background(ignoresSafeAreaEdges: .all)
			
		}
	}
}

#Preview {
	HomeView()
		.environment(FurnitureModelView())
}

struct Menu: View {
	@State var menuSelected:FurnitureData.Item.Categories = .all
	var body: some View {
		ScrollView(.horizontal) {
			HStack(spacing: 6){
				ForEach(FurnitureData.Item.Categories.allCases, id: \.self) { item in
					Text(item.rawValue).tag(item.hashValue)
						.font(.custom("Plus Jakarta Sans Bold", size: 18))
						.foregroundStyle(.accent)
						.padding(4)
						.background(
							item == menuSelected ? Color.accentColor.opacity(0.2) : Color.clear
						)
						.cornerRadius(8)
						.onTapGesture {
							menuSelected = item
						}
					
				}
			}
			
		}
		.scrollIndicators(.hidden)
		.padding(.top, 8)
	}
}

struct Search: View {
	@Binding var searchField: String
	
	var body: some View {
		HStack {
			HStack {
				Image(systemName: "magnifyingglass")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: 22, alignment: .center)
					.foregroundStyle(.accent)
				TextField("Search", text: $searchField)
					.textCase(.lowercase)
					.padding(8)
			}
			.padding(8)
			.background(Color.white)
			
			.clipShape(RoundedRectangle(cornerRadius: 25.0))
			Spacer()
			Image("Scan3")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 55, alignment: .center)
		}
		.padding(6)
	}
}


struct Title: View {
	var body: some View {
		HStack(alignment: .firstTextBaseline){
			Text("Find the \nBest ")
				.font(.custom("Plus Jakarta Sans ExtraLight", size: 25))
				.foregroundStyle(.accent)
			+ Text("Furniture!")
				.font(.custom("Plus Jakarta Sans Bold", size: 25))
				.foregroundStyle(.accent)
			Spacer()
		}
	}
}
