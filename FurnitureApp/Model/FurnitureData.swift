//
//  Furniture.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import Foundation

// MARK: - Furniture
struct FurnitureData: Codable {
	var furnitureStore: FurnitureStore
	
	enum CodingKeys: String, CodingKey {
		case furnitureStore = "furniture_store"
	}
	
	
	// MARK: - FurnitureStore
	struct FurnitureStore: Codable {
		var items: [Item]
	}
	
	// MARK: - Item
	struct Item: Codable, Identifiable, Hashable { 
		var id: Int
		var name, description: String
		var price: Double
		var color: String
		var size: Size
		var category: Categories
		var dimensions: Dimensions
		var material: String
		var ventas: Int
		var stars: Int
		var resenas: Int
		var favorito: Bool
		var image: Int
		
		
		enum Categories: String, CaseIterable, Codable, Hashable {
			case all = "All"
			case sala = "Sala"
			case comedor = "Comedor"
			case oficina = "Oficina"
			case dormitorio = "Dormitorio"
			case almacenamiento = "Almacenamiento"
			case cocina = "Cocina"
			case decoracion = "Decoración"
		}
		
		enum Size: String, Codable, Hashable {
			case grande = "Grande"
			case mediano = "Mediano"
			case pequeño = "Pequeño"
		}
		
		
		
	}
	
	// MARK: - Dimensions
	struct Dimensions: Codable, Hashable {
		var width, height, depth: String
	}
	
	
	
	
}
