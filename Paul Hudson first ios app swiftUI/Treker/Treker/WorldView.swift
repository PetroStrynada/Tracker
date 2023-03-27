//
//  WorldView.swift
//  Treker
//
//  Created by Petro Strynada on 08.02.2023.
//

import MapKit
import SwiftUI

struct WorldView: View {
    
    //making var locations that takes data from Locations
    // fi it no Locations in your app it well crash
    @EnvironmentObject var locations: Locations
    
    //MC - map kit
    //CL - co location співрозташуваня. You mast put in latitude and longitude
    //for Kiev latitude: 50.450001, longitude: 30.523333
    //span - for map zooming
    
    //main
    //1) make var not let, so your map can update with it changes
    //2) add wrap, so swift will it will keep this data alive makes it readable
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.450001, longitude: 30.523333),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    var body: some View {
        
        //$ mean that we will read and update the changes from original value
        Map(coordinateRegion: $region,
            //for access to our locations object with all JSON loaded data
            //we pass it in annotationItems: locations.places
            annotationItems: locations.places) {
            //add some cod so every location can finds
            //location coming in
            location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                //adding here navigation link, so our flag images can pass on clic to JSON data
                //pass to destination ContentView() with location: location
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                    //also don't forget to make Location: Identifiable
                }
            }
            
        }
            .navigationTitle("Regions")
        
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
            .environmentObject(Locations())
    }
}
