//
//  ContentView.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 31.03.2024.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading)  {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes) { r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundStyle(.black)
                                }
                            }
                            
                        }
                    }
                }
            }.navigationBarHidden(true)
                .padding(.leading)
        }
    }
}

#Preview {
    RecipeListView()
        .environmentObject(RecipeModel())
}
