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
					ForEach(Array(modelData.cartList.keys), id: \.self) { key in
						if let value = modelData.cartList[key] {
							HStack {
								Text("Item: \(key.name)")
								Spacer()
								Text("Cantidad: \(value)")
							}
						}
				}
		    }
	}
}

#Preview {
    ShopView()
		.environment(FurnitureModelView())
}

struct Row: View {
	var body: some View {
		HStack(alignment: .center , spacing: 3){
			Image("mueble1")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 100, height: 100, alignment: .center)
			
			VStack(alignment: .leading, spacing: 10){
				Text("Nombre del mueble")
					.font(.custom("Plus Jakarta Sans", size: 14))
				//					Spacer()
				Text("$234.334")
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
					.foregroundStyle(.accent)
				Spacer()
				HStack(alignment: .center, spacing: 8){
					Spacer()
					Image(systemName: "plus.circle")
						.foregroundStyle(Color.accent)
					Text("1")
						.font(.custom("Plus Jakarta Sans Bold", size: 18))
					Image(systemName: "minus.circle.fill")
						.foregroundStyle(Color.accent)
				}
			}
			.padding(.top, 5)
			
		}
		.frame(minWidth: 335, alignment: .leading)
	}
}
