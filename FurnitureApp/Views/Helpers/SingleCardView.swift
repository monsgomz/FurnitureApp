//
//  SingleCardView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-17.
//

import SwiftUI

struct SingleCardView: View {
	var muebleInfo : FurnitureData.Item
	
	var imageMueble: Int = Int.random(in: 1...4)
	
	// MARK: A property wrapper type that supports creating bindings to the mutable properties of observable objects.
	@Bindable var favoAdd = FurnitureModelView()
	
	var furnitureIndex : Int {
		favoAdd.muebles.firstIndex(where: { $0.id == muebleInfo.id })!
	}
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 0) {
			
			ZStack (alignment: .center){
				Image("mueble\(imageMueble)")
					.resizable()
					.scaledToFit()
					.frame(width: 135, height: 150, alignment: .center)
				.padding()
			}

			Text(muebleInfo.name)
				.font(.custom("Plus Jakarta Sans Bold", size: 14))
				.padding(.leading, 5)
				.padding(.bottom, 10)
			
			//bottom
			HStack {
				Text("$\(muebleInfo.ventas)")
					.font(.custom("Plus Jakarta Sans Regular", size: 12))
					.padding(.leading, 5)
				Spacer()
				FavoHeart(favoAdd: $favoAdd.muebles[furnitureIndex].favorito
				)
				.padding(.trailing, 5)
			}
			.frame(width: 180)
			.padding(.bottom)
		}
//		.background(Color.white)
		.border(Color.white, width: 1)
		.frame(width: 145, height: 230, alignment: .center)
		.padding()
		
	}
}

#Preview {
	SingleCardView(muebleInfo: FurnitureModelView().muebles.first!)
}
