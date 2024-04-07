//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 05.04.2024.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured View")
                .bold()
                .padding([.leading])
                .padding(.top, 40)
                .font(.largeTitle)

            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6), radius: 10, x: -5, y: 5)

                        }
                        
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation time: ")
                    .font(.headline)
                Text("one hour")
                Text("Highlights: ")
                    .font(.headline)
                Text("Healthy, Hearty")
            }.padding([.leading, .bottom])
        }
    }
}

#Preview {
    RecipeFeaturedView()
        .environmentObject(RecipeModel())
}
