//
//  CardView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
// Vista para una Card

import SwiftUI

struct CardView: View {
	
    var body: some View {
		
		VStack(alignment: .leading, spacing: 0) {
			
			ZStack (alignment: .topTrailing){
				Image("mueble1")
					.resizable()
					.scaledToFit()
					.frame(width:260, height: 250, alignment: .center)
					.clipShape(RoundedRectangle(cornerRadius: 20.0))
					.shadow(
						color: Color(.sRGBLinear, white: 0, opacity: 0.23),
						radius: CGFloat(15),
						x: CGFloat(0), y: CGFloat(0))
					.padding()
				
					Image(systemName: "heart")
					.resizable()
					.scaledToFit()
					.frame(height: 25, alignment: .leading)
					.padding()
				
			}
			.padding(5)
			
			Text("Nombre del mueble")
				.font(.custom("Plus Jakarta Sans Bold", size: 18))
				.padding(.leading, 20)
				.padding(.bottom, 10)
			
			//bottom
			HStack {
				StarsView()
					.padding(.leading, 10)
				Spacer()
				Text("$000.00")
					.font(.custom("Plus Jakarta Sans Regular", size: 16))
			}
			.padding([.bottom, .leading], 12)
		}
		.background(Color.white)
		.frame(width: 280, height: 350, alignment: .center)
		.clipShape(RoundedRectangle(cornerRadius: 25.0))
		.padding()
		
    }
}

#Preview {
    CardView()
}
