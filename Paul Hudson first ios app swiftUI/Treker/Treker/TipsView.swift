//
//  TipsView.swift
//  Treker
//
//  Created by Petro Strynada on 16.02.2023.
//

import SwiftUI

struct TipsView: View {
    
    let tips: [Tip]
    
    init() {
        
        //Uniform Resource Locator
        //looking for the file locations with extension .json on our iPhone
        //the problem could be with (forResource: "tips") because "tips" or "names" instead can be not exist. It will crash our app
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        // ! means that it will definitely work. I promise. because if it's not then the app will crash.
        //We should avoid ! operator if not shoer on 100% in our files we are passing in
        
        //try to load url to the Data. If it is not exist app will crash
        let data = try! Data(contentsOf: url)

        //placing data from Tip to place by decoding
        tips = try! JSONDecoder().decode([Tip].self, from: data) //.self means we refer to array of Locations generally. Not particularly one but generally
        
    }
    
    var body: some View {
        
        //id: \.text tells that text is unique identifier
        //children: \.children refers to text in array and shows the text under the Label
        List(tips, id: \.text, children: \.children) { tip in
            
            //it passable because children may have array or may be empty
            //It is optional
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
                    .font(.headline)
            } else {
                Text(tip.text)
            }
        }
        
        //as posable option
//        List {
//            ForEach(tips, id: \.text) { tip in
//            if tip.children != nil {
//              Label(tip.text, systemImage: "quote.bubble")
//                   .font(.headline)
//            } else {
//              Text(tip.text)
//          }
//        }
        
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
