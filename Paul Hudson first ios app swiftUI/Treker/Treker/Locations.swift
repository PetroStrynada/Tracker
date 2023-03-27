//
//  Locations.swift
//  Treker
//
//  Created by Petro Strynada on 08.02.2023.
//

import Foundation

//structs are excellent if you don't want to share data
//for data that must be shared with other parts of the program we use class
//Classes are designed to be shared

//ObservableObject is for swift looks for changes of this class
class Locations: ObservableObject {
    
    //[] for holding all Locations from JSON file
    let places: [Location]
    
    //after that change to ContentView(location: Locations()) within the preview in ContentView and TrekerApp
    //The result is shows 0 pice of Location array
    var primarily: Location {
        places[0]
    }
    
    //such initialization can crash app if JSON file will be invalid
    init() {
        
        //Uniform Resource Locator
        //looking for the file locations with extension .json on our iPhone
        //the problem could be with (forResource: "locations") because "locations" or "names" instead can be not exist. It will crash our app
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        // ! means that it will definitely work. I promise. because if it's not then the app will crash.
        //We should avoid ! operator if not shoer on 100% in our files we are passing in
        
        //try to load url to the Data. If it is not exist app will crash
        let data = try! Data(contentsOf: url)

        //placing data from Location to place by decoding
        places = try! JSONDecoder().decode([Location].self, from: data) //.self means we refer to array of Locations generally. Not particularly one but generally
        
    }
}
