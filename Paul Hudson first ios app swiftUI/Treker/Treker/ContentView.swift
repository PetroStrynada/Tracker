//
//  ContentView.swift
//  Treker
//
//  Created by Petro Strynada on 07.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    //for changing view we mast refer to Location thru this constant
    let location: Location
    
    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            
            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(location.description)
                .padding(.horizontal)
            
            Text("Did you know?")
                .font(.title3)
                .bold()
                .padding(.top)
            
            Text(location.more)
                .padding(.horizontal)
        }
        //Add navigation title and wrap ContentView() in TrekerApp within NavigationView
        //for making top padding
        //so the app text cannot cross the top of the screen
        .navigationTitle("Discovery")
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        //add here and in TrekerApp TabView
        TabView {
            //makes navigation bar at the top
            NavigationView {
                //add location: location.example also to TrekerApp
                //ContentView(location: Location.example)
                
                //adding data directly from JSON file
                ContentView(location: Locations().primarily)
            }
            //add here tabItem to make tab icon
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
        .environmentObject(Locations())
    }
}

