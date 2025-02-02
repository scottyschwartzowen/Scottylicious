//
//  RecipeCategoryGridView.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 3/24/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {

	@EnvironmentObject private var recipeData: RecipeData
	@State private var navigationPath = NavigationPath() // Holds the navigation state

	var body: some View {
		let columns = [GridItem(), GridItem()]

		// Bind the NavigationStack to a NavigationPath
		NavigationStack(path: $navigationPath) {
			ScrollView {
				LazyVGrid(columns: columns, content: {
					ForEach(MainInformation.Category.allCases, id: \.self) { category in
						NavigationLink(
							destination: RecipesListView(viewStyle: .singleCategory(category)),
							label: {
								CategoryView(category: category)
							})
					}
				})
			}
			.navigationTitle("Categories")
			.onChange(of: navigationPath) { newPath in
				// Whenever the navigation path changes, you can react if needed.
				print("Navigation path changed: \(newPath)")
			}
		}
	}

	// Function to reset the navigation stack to the root view
	func resetNavigationStack() {
		navigationPath.removeLast(navigationPath.count) // Remove all views from the path
	}
}

struct CategoryView: View {
	let category: MainInformation.Category

	var body: some View {
		ZStack {
			Image(category.rawValue)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.opacity(0.40)
			Text(category.rawValue)
				.font(.title)
				.fontWeight(.bold)
		}
	}
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
	static var previews: some View {
		RecipeCategoryGridView()
	}
}
