//
//  TabBarOptions.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-12.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
	case home = 0
	case favorite
	case shop
	case profile
	
	var title: String{
		switch self {
		case .home:
			return "Home"
		case .favorite:
			return "Favorite"
		case .shop:
			return "Shop"
		case .profile:
			return "Profile"
		}
	}
	
	var iconName: String{
		switch self {
		case .home:
			return "house"
		case .favorite:
			return "heart.fill"
		case .shop:
			return "cart"
		case .profile:
			return "person"
		}
	}
}
