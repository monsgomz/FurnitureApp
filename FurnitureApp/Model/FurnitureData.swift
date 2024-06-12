//
//  Furniture.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import Foundation

struct FurnitureData: Codable{
	var furnitureStore: FurnitureStore
	
	// MARK: - FurnitureStore
	struct FurnitureStore: Codable {
		var items: [Item]
	}
	
	// MARK: - Item
	struct Item: Codable, Identifiable {
		var id: Int
		var name, description: String
		var price: Double
		var color: String
		var size: Size
		var category: String
		var dimensions: Dimensions
		var material: String
		
		enum Size: String, CaseIterable, Codable  {
			case grande = "Grande"
			case mediano = "Mediano"
			case pequeño = "Pequeño"
		}
		
		enum Category: String, CaseIterable, Codable{
			case sala = "Sala"
			case comedor = "Comedor"
			case oficina = "Oficina"
			case dormitorio = "Dormitorio"
			case almacenamiento = "Almacenamiento"
			case cocina = "Cocina"
			case decoracion = "Decoración"
		}
	}
	
	// MARK: - Dimensions
	struct Dimensions: Codable {
		var width, height, depth: String
	}
	
	
	
}
