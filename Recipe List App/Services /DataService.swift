//
//  DataService.swift
//  Recipe List App
//
//  Created by Akhmet Tolepov on 31.03.2024.
//

import Foundation
class DataService {
    static func getLocalData() -> [Recipe] {
        // Parse lcoal json files
        
        //Get a url path to the json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            // Create a data object
            
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    // adding new ids to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch {
                print(error)
            }
            
            
            
            // Return recipes

        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
