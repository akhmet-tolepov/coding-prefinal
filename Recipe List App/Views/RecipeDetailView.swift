//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 31.03.2024.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom)
                    ForEach(recipe.ingredients) { i in
                        Text("• " + i.name)
                        
                    }
                }.padding(.horizontal, 5)
                VStack(alignment:.leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal, 5)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View{
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
