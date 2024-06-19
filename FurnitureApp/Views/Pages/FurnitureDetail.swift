//
//  FurnitureDetail.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-13.
//

import SwiftUI

struct FurnitureDetail: View {
	
	var muebleInfo : FurnitureData.Item
	@State var quantityItem: Int = 0
	@Binding var hideTabBar: Bool

    var body: some View {
		VStack {
			ZStack {
				
				VStack{
					Image("mueble\(muebleInfo.image)")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.ignoresSafeArea()
						.frame(height: 300)
					
					Description(muebleInfo: muebleInfo, quantityItem: $quantityItem)
						.offset(y: -60)
					
					BottomPrice(muebleInfo: muebleInfo, quantityItem: quantityItem)
						.offset(y: -80)
				}
//				.ignoresSafeArea(edges: .bottom)
				
				
			}

		}
		.onAppear {
			hideTabBar = true // Mostrar la barra de pestañas al entrar en esta vista
		}
		.onDisappear{
			hideTabBar = false
		}
		
    }
}

#Preview {
	
	FurnitureDetail(muebleInfo: FurnitureModelView().muebles.first!, hideTabBar: .constant(false))
		.environment(FurnitureModelView())
}

struct Size: View {
	var muebleInfo : FurnitureData.Item
	var body: some View {
		VStack(alignment: .leading){
			Text("Size")
				.font(.custom("Plus Jakarta Sans Bold", size: 17))
				.padding(.bottom, 5)
			HStack {
				Text("Width:")
				Text("\(muebleInfo.dimensions.width)")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
			HStack {
				Text("Height:")
				Text("\(muebleInfo.dimensions.height)")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
			HStack {
				Text("Depth:")
				Text("\(muebleInfo.dimensions.depth)")
			}
			.font(.custom("Plus Jakarta Sans ", size: 16))
			.foregroundStyle(Color.gray)
		}
		
	}
}

struct Description: View {
	var muebleInfo : FurnitureData.Item
	@Binding var quantityItem: Int
	var body: some View {
		VStack(alignment: .leading){
			Text(muebleInfo.name)
				.font(.custom("Plus Jakarta Sans Bold", size: 21))
			
			HStack(spacing: 3){
				ForEach(0..<muebleInfo.stars) { _ in
					Image(systemName: "star")
						.foregroundColor(.yellow)
				}
				Text("(\(muebleInfo.resenas)")
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
			
			Text("\(muebleInfo.description)")
				.frame(height: 60, alignment: .center)
				.lineLimit(2)
				.foregroundStyle(Color.gray)
				.padding(.bottom)
			
			HStack{
				Size(muebleInfo: muebleInfo)
				Spacer()
				Material()
			}
			
			Divider()
				.padding()
			
			ColorSection(quantityItem: $quantityItem)
			
			
		}
		.padding()
		.background(Color.white)
		.frame(maxHeight: .infinity)
		.clipShape(RoundedRectangle(cornerRadius: 25.0), style: FillStyle())
	}
}

struct BottomPrice: View {
	//Se agrega un elemento al diccionario de tienda
	@Environment(FurnitureModelView.self) var modelData
	var muebleInfo : FurnitureData.Item
	var quantityItem: Int
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
				print("Item: \(muebleInfo.name) + \(quantityItem)")
				modelData.cartList[muebleInfo] = quantityItem
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
	@Binding var quantityItem: Int
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
					Button{
						quantityItem = quantityItem <= 0 ? 0 : quantityItem - 1
					} label: {
						Image(systemName: "minus.circle")
							.foregroundStyle(Color.accent)
					}
					Text("\(quantityItem)")
					Button{
						quantityItem = quantityItem + 1
					} label: {
						Image(systemName: "plus.circle.fill")
							.foregroundStyle(Color.accent)
					}
					
				}
			}
		}
	}
}
