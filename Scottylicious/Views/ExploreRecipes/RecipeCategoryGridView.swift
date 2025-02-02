//
//  RecipeCategoryGridView.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 3/24/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {
	
	@EnvironmentObject private var recipeData: RecipeData

	var body: some View {
		let columns = [GridItem(), GridItem()]
		
		NavigationView {
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
		}
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
