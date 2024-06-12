//
//  FurnitureModelView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import Foundation

class furnitureModelView {
	
	var muebles: [FurnitureData.Item] = load("muebles.json").first?.furnitureStore.items ?? [] //cargamos el archivo
	
	//Diccionario de categorias
	var categories: [String: [FurnitureData.Item]] {
		Dictionary(grouping: muebles, by: { $0.category} //el elemento lee su categoria
		)
	}
}

func load(_ filename: String) -> [FurnitureData] {
	let data: Data
	
	guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
	else {
		fatalError("Couldn't find \(filename) in main bundle.")
	}
	
	
	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
	}
	
	
	do {
		let decoder = JSONDecoder()
		
		return try decoder.decode([FurnitureData].self, from: data)
	} catch {
		fatalError("Couldn't parse \(filename) as \([FurnitureData].self):\n\(error)")
	}
	}
