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
    var body: some View {
		NavigationStack {
			ZStack {
				Color(.bg)
				ScrollView {
					VStack {
						TopBar()
						
						
						Text("Find the \nBest ")
							.font(.custom("Plus Jakarta Sans ExtraLight", size: 25))
							.foregroundStyle(.accent)
						+ Text("Furniture!")
							.font(.custom("Plus Jakarta Sans Bold", size: 25))
							.foregroundStyle(.accent)
						
						//MARK: Search + scan
						
						Search(searchField: $searchField)
						
						//MARK: Menu
						Menu()
						
						HStack {
							Text("Popular")
								.font(.custom("Plus Jakarta Sans Bold", size: 21))
							Spacer()
							
						}
						.padding(.top, 10)
						
						ScrollView(.horizontal){
							HStack {
								CardView()
								CardView()
								CardView()
								CardView()
							}
						}
						
						HStack {
							Text("Best")
								.font(.custom("Plus Jakarta Sans Bold", size: 21))
							Spacer()
							
						}
						.padding(.top, 10)
						ScrollView(.horizontal){
							HStack {
								CardView()
								CardView()
								CardView()
								CardView()
							}
						}
						
						
					}
					.padding()
				}
				
			}
			.edgesIgnoringSafeArea(.all)
			
		}
    }
}

#Preview {
    HomeView()
		.environment(FurnitureModelView())
}

struct TopBar: View {
	var body: some View {
		HStack{
			Image(systemName: "line.3.horizontal.circle")
				.resizable()
				.foregroundStyle(.accent)
				.scaledToFit()
				.frame(height: 30)
			Spacer()
			Image(systemName: "person.circle")
				.resizable()
				.foregroundStyle(.accent)
				.scaledToFit()
				.frame(height: 30)
		}
		.padding(.horizontal)
	}
}

struct Menu: View {
	var body: some View {
		ScrollView(.horizontal) {
			HStack(spacing: 10){
				ForEach(FurnitureData.Item.Categories.allCases, id: \.self) { item in
					Text(item.rawValue).tag(item)
						.font(.custom("Plus Jakarta Sans Bold", size: 18))
						.foregroundStyle(.accent)
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

