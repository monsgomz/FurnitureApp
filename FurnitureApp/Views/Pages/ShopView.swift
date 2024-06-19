//
//  ShopView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-12.
//

import SwiftUI

struct ShopView: View {
	@Environment(FurnitureModelView.self) var modelData
	@State var pickerSelection: Int = 1
	
	var body: some View {
		VStack {
			Picker(selection: $pickerSelection){
				Text("Cart")
					.tag(1)
				Text("Track")
					.tag(2)
			} label: {
				Label("label", systemImage: "heart")
			}
			.pickerStyle(.palette)
			.padding()
			
			List {
				ForEach(Array(modelData.cartList), id: \.key){ item in
					ShopRow(itemInfo: item.key, quantityItem: item.value)
				}
			}
			
			.overlay {
				if modelData.cartList.isEmpty {
					
					ContentUnavailableView(label: {
						Label("Empty cart", systemImage: "cart")
					}, description: {Text("Start adding items to see your list")
					})
					.offset(y: -60)
				}
			}
		
		}
		.navigationTitle("Shop")
		
	}
}

#Preview {
	ShopView()
		.environment(FurnitureModelView())
}
