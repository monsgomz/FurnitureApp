//
//  FurnitureDetail.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-13.
//

import SwiftUI

struct FurnitureDetail: View {
    var body: some View {
		VStack {
			ZStack {
				
				VStack{
					Image("mueble1")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.ignoresSafeArea()
					
					Description()
						.offset(y: -60)
					
					BottomPrice()
						.offset(y: -70)
				}
				.ignoresSafeArea(edges: .bottom)
				
				
			}

		}
		
    }
}

#Preview {
    FurnitureDetail()
}

struct Size: View {
	var body: some View {
		VStack(alignment: .leading){
			Text("Size")
				.font(.custom("Plus Jakarta Sans Bold", size: 17))
				.padding(.bottom, 5)
			HStack {
				Text("Width:")
				Text("123")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
			HStack {
				Text("Height:")
				Text("123")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
			HStack {
				Text("Depth:")
				Text("123")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
		}
		
	}
}

struct Description: View {
	var body: some View {
		VStack(alignment: .leading){
			Text("Name")
				.font(.custom("Plus Jakarta Sans Bold", size: 21))
			
			HStack(spacing: 3){
				StarsView()
				StarsView()
				StarsView()
				Text("(23.9)")
					.font(.custom("Plus Jakarta Sans ExtraLight", size: 14))
				Spacer()
			}
			.padding(.bottom)
			
			HStack {
				Text("Description")
					.font(.custom("Plus Jakarta Sans Bold", size: 18))
				Text("Review")
					.font(.custom("Plus Jakarta Sans Light", size: 16))
					.foregroundStyle(.accent)
			}
			.padding(.bottom)
			
			Text("Sofá de tres plazas con diseño moderno y cojines cómodos.")
				.frame(height: 60, alignment: .center)
				.lineLimit(2)
				.foregroundStyle(Color.gray)
				.padding(.bottom)
			
			HStack{
				Size()
				Spacer()
				Material()
			}
			
			Divider()
				.padding()
			
			ColorSection()
			
			
		}
		.padding()
		.background(Color.white)
		.frame(maxHeight: .infinity)
		.clipShape(RoundedRectangle(cornerRadius: 25.0), style: FillStyle())
	}
}

struct BottomPrice: View {
	var body: some View {
		HStack{
			Spacer()
			Text("$123")
				.font(.custom("Plus Jakarta Sans Bold", size: 23))
				.foregroundStyle(Color.white)
			Spacer()
			Spacer()
			Spacer()
			Button("Add to Cart") {
				print("add shop")
			}
			.foregroundStyle(Color.brown)
			.padding()
			.background(Color.white)
			.clipShape(RoundedRectangle(cornerRadius: 20.0))
Spacer()
		}
		.frame(maxWidth: .infinity, alignment: .bottom)
		.padding(15)
		.background(Color.brown)
		.clipShape(RoundedRectangle(cornerRadius: 35.0), style: FillStyle())
		.shadow(radius: 10)
	}
}

struct Material: View {
	var body: some View {
		VStack(alignment: .leading){
			Text("Material")
				.font(.custom("Plus Jakarta Sans Bold", size: 17))
				.padding(.bottom, 5)
			Text("Tela y madera")
				.foregroundStyle(Color.gray)
		}
	}
}

struct ColorSection: View {
	var body: some View {
		HStack {
			VStack(alignment: .leading){
				Text("Color")
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
					.padding(.bottom, 5)
				HStack(alignment: .firstTextBaseline, spacing: 5){
					Color.accent
						.frame(width: 20 , height: 20)
						.clipShape(Circle())
					
					Color.brown
						.frame(width: 20 , height: 20)
						.clipShape(Circle())
					Spacer()
				}
				
			}
			Spacer()
			
			VStack(alignment: .leading){
				Text("Quantity")
					.font(.custom("Plus Jakarta Sans Bold", size: 16))
					.padding(.bottom, 5)
				HStack(alignment: .center, spacing: 8){
					Image(systemName: "plus.circle")
						.foregroundStyle(Color.accent)
					Text("1")
						.font(.custom("Plus Jakarta Sans Bold", size: 18))
					Image(systemName: "minus.circle.fill")
						.foregroundStyle(Color.accent)
				}
			}
		}
	}
}