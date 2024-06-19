//
//  ProfileView.swift
//  FurnitureApp
//
//  Created by Montserrat Gomez on 2024-06-12.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
		VStack{
			
				List{
					
					Section{
						HStack{
							Image("profile")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 100, height: 100, alignment: .center)
								.clipShape(Circle())
							Text("User name:")
							Text("Profile 1")
						}
							HStack{
								Text("Email:")
								Text("profile.113@gmail.com")
							}
//						}
						
					}
					
					Section{
						Label("Account", systemImage: "key")
						Label("Privacy", systemImage: "lock")
						Label("Notifications", systemImage: "bell")
					} header: {
						Text("Information")
					}
					
					Section{
						Label("Orders", systemImage: "archivebox")
						Label("Return", systemImage: "tray.and.arrow.up")
					} header: {
						Text("Order")
					}
					
					Section{
						
						Label("About", systemImage: "exclamationmark.circle")
						Label("Help", systemImage: "questionmark.circle")
						Label("Tell a friend", systemImage: "heart")
					} header: {
						Text("Store")
					}
					Spacer()
					
				}
				
		}
		.navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}
