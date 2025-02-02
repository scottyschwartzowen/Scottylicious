//
//  MainTabView.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 7/24/24.
//

import SwiftUI

struct MainTabView: View {

	@StateObject var recipeData = RecipeData()

    var body: some View {
			TabView {
				RecipeCategoryGridView()
					.tabItem {
						Label("Recipes", systemImage: "list.dash")
					}
				NavigationStack {
					RecipesListView(viewStyle: .favorites)
				}
				.tabItem {
					Label("Favorites", systemImage: "heart.fill")
				}
				SettingsView()
					.tabItem {
						Label("Settings", systemImage: "gear")
					}
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
