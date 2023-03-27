//
//  TrekerApp.swift
//  Treker
//
//  Created by Petro Strynada on 07.02.2023.
//

import SwiftUI

@main
struct TrekerApp: App {
    
    //we are taking out property from here ContentView(location: Locations().primarily)
    //And pass it there
    //make locations object here it belongs to whole apps
    //It will load all information from class Locations() that keeping all data from a JSON file named locations
    //wrap @StateObject means that swiftUI will own it, so keep it live for me
    //also it is required class Locations: to be an ObservableObject
    @StateObject var locations = Locations()
    
    var body: some Scene {
        WindowGroup {
            
            
            TabView {
                //Add here NavigationView to make top padding with navigation title
                //so the app text cannot cross the top of the screen
                //makes navigation bar at the top
                NavigationView {
                    //add location: location.example also to TrekerApp
                    //ContentView(location: Location.example)
                    
                    //adding data directly from JSON file
                    //ContentView(location: Locations().primarily)
                    
                    //and now we are passing that constant here
                    ContentView(location: locations.primarily)
                }
                .tabItem {
                    Label("Discovery", systemImage: "airplane.circle.fill")
                }
                
                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Label("Locations", systemImage: "star.fill")
                }
                
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Label("Tips", systemImage: "list.bullet")
                }
            }
            
            //now passing within .environmentObject object (locations) so any one how wants to read it can now
            //we can pass ones loaded data to var locations from class Locations() that keeping all data from a JSON file named locations
            //so we don't need to load that agin and agin and agin
            .environmentObject(locations)
            //.environmentObject(tips)
        }
    }
}


//WindowGroup {
//    //Add here NavigationView to make top padding with navigation title
//    //so the app text cannot cross the top of the screen
//    //makes navigation bar at the top
//    NavigationView {
//        //add location: location.example also to TrekerApp
//        //ContentView(location: Location.example)
//
//        //adding data directly from JSON file
//        ContentView(location: Locations().primarily)
//    }
//}
