//
//  FavoHeart.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-17.
//

import SwiftUI

struct FavoHeart: View {
	@Binding var favoAdd: Bool
	
    var body: some View {
		
		Button {
			favoAdd.toggle()
		} label: {
			Label("Favorite", systemImage: favoAdd ? "heart.fill" : "heart")
				.labelStyle(.iconOnly)
				.foregroundStyle(favoAdd ? .primaryC : .accent)
		}
		.frame(height: 10, alignment: .center)
		
    }
}

#Preview {
	FavoHeart(favoAdd: .constant(false))
}
