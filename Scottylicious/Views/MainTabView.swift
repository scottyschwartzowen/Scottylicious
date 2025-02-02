//
//  MainTabView.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 7/24/24.
//

import SwiftUI

struct MainTabView: View {

	@StateObject var recipeData = RecipeData()
	@State private var selectedTab = 0 // Track the selected tab

	var body: some View {
		TabView(selection: $selectedTab) {

			// Recipe Category Grid Tab
			RecipeCategoryGridView()
				.tabItem {
					Label("Recipes", systemImage: "list.dash")
				}
				.tag(0) // Tag for the Recipes tab
				.onChange(of: selectedTab) { newTab in
					// Reset the navigation stack when the "Recipes" tab is tapped
					if newTab == 0 {
						// Find the current RecipeCategoryGridView instance and reset navigation
						// We can use an environment object or directly call reset if passing a method
					}
				}

			// Favorites Tab
			NavigationStack {
				RecipesListView(viewStyle: .favorites)
			}
			.tabItem {
				Label("Favorites", systemImage: "heart.fill")
			}
			.tag(1)

			// Settings Tab
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gear")
				}
				.tag(2)
		}
		.environmentObject(recipeData)
		.onAppear {
			recipeData.loadRecipes()
		}
	}
}

#Preview {
	MainTabView()
}
