//
//  FurnitureAppApp.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-11.
//

import SwiftUI

@main
struct FurnitureAppApp: App {
	@State private var furnitureData = FurnitureModelView() //para inicializar la instancia del modelo
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(furnitureData)
		}
    }
}
