//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 02.04.2024.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }.environmentObject(RecipeModel())
        
    }
}

#Preview {
    RecipeTabView()
}
