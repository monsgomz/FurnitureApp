//
//  ShopRow.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-18.
//

import SwiftUI

struct ShopRow: View {
	
	@Environment(FurnitureModelView.self) var modelData
	var itemInfo: FurnitureData.Item
	@State var quantity: Int = 0
	var quantityItem: Int
    var body: some View {
		
		HStack(alignment: .center , spacing: 3){
			Image("mueble1")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 100, height: 100, alignment: .center)
			
			VStack(alignment: .leading, spacing: 10){
				Text(itemInfo.name)
					.font(.custom("Plus Jakarta Sans", size: 14))
			
				Text("$\(itemInfo.ventas)")
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
					.foregroundStyle(.accent)
				Spacer()
				HStack(alignment: .center, spacing: 8){
					Spacer()
					Button {
						quantity = quantity <= 0 ? 0 : quantity - 1
					}label: {
						Image(systemName: "minus.circle.fill")
							.foregroundStyle(Color.accent)
					}
					
					Text("\(quantityItem)")
						.font(.custom("Plus Jakarta Sans Bold", size: 18))
					Button {
						quantity = quantity + 1
					} label: {
						Image(systemName: "plus.circle.fill")
							.foregroundStyle(Color.accent)
					}
					
				}
			}
			.padding(.top, 5)
			
		}
		.padding(8)
		.frame(height: 110, alignment: .center)
    }
}

#Preview {
	ShopRow(itemInfo: FurnitureModelView().muebles.first!, quantityItem: 0)
		.environment(FurnitureModelView())
}
