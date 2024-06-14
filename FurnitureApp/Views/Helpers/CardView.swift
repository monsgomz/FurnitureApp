//
//  CardView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
// Vista para una Card

import SwiftUI

struct CardView: View {
	var muebleInfo : FurnitureData.Item
	
	var imageMueble: Int = Int.random(in: 1...4)
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 0) {
			
			ZStack (alignment: .topTrailing){
				Image("mueble\(imageMueble)")
					.resizable()
					.scaledToFit()
					.frame(width:260, height: 240, alignment: .center)
					.clipShape(RoundedRectangle(cornerRadius: 20.0))
					.shadow(
						color: Color(.sRGBLinear, white: 0, opacity: 0.23),
						radius: CGFloat(15),
						x: CGFloat(0), y: CGFloat(0))
					.padding()
				
				Image(systemName: "heart")
					.resizable()
					.scaledToFit()
					.foregroundStyle(.primaryC)
					.frame(height: 25, alignment: .leading)
					.padding()
			}
			.padding(5)
			
			Text(muebleInfo.name)
				.font(.custom("Plus Jakarta Sans Bold", size: 18))
				.padding(.leading, 25)
				.padding(.bottom, 10)
			
			//bottom
			HStack {
				ForEach(0..<muebleInfo.stars) { _ in
					Image(systemName: "star")
						.foregroundColor(.yellow)
				}
				Text("(\(muebleInfo.resenas))")
					.font(.caption)
				Spacer()
				Text("$\(muebleInfo.ventas)")
					.font(.custom("Plus Jakarta Sans Regular", size: 16))
			}
			.padding([.bottom, .leading], 15)
		}
		.background(Color.white)
		.frame(width: 280, height: 350, alignment: .center)
		.clipShape(RoundedRectangle(cornerRadius: 25.0))
		.padding()
		
	}
}

//#Preview {
//	
//	let exampleItem = FurnitureData.Item(
//		id: 1,
//		name: "Sofá Moderno",
//		description: "Sofá de tres plazas con diseño moderno y cojines cómodos.",
//		price: 299.99,
//		color: "Gris",
//		size: .grande,
//		category: FurnitureData.Item.Categories.cocina,
//		dimensions: FurnitureData.Dimensions(width: "200cm", height: "85cm", depth: "90cm"),
//		material: "Tela y madera",
//		ventas: 120
//	)
//	
//	CardView(muebleInfo: exampleItem)
//	
//}
