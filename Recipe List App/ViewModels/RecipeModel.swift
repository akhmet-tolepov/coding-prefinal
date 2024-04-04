//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 31.03.2024.
//

import Foundation
class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    init() {
        // create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
}
