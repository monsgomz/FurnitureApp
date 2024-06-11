//
//  ContentView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			VStack {
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
				
				Text("Find the \nBest ")
					.font(.custom("Plus Jakarta Sans ExtraLight", size: 25))
					.foregroundStyle(.accent)
				+ Text("Furniture!")
					.font(.custom("Plus Jakarta Sans Bold", size: 25))
					.foregroundStyle(.accent)
					
				
					
					
				
			   
			}
			.padding()
		}
    }
}

#Preview {
    ContentView()
}
