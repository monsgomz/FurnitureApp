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
					.clipShape(RoundedRectangle(cornerRadius: 25.0))
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
			.padding(.bottom)
			
			Text("Nombre del mueble")
				.font(.custom("Plus Jakarta Sans Bold", size: 18))
				.padding([.leading, .bottom], 12)
			
			//bottom
			HStack {
				StarsView()
				Spacer()
				Text("$000.00")
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
			}
			.padding([.bottom, .horizontal], 12)
		}
		.background(Color.white)
		.overlay(RoundedRectangle(cornerRadius: 25.0)
			.stroke(.blue, lineWidth: 4)
		)
		.padding()
		
    }
}

#Preview {
    CardView()
}
