//
//  Tip.swift
//  Treker
//
//  Created by Petro Strynada on 16.02.2023.
//

//Created to work with tips.json

import Foundation

//Decodable can be only decode
struct Tip: Decodable {
    
    let text: String
    //Look at children, they mast be as na array of Tip
    //Tip is the main struct, and children on that is an array of Tips
    //Array is the save variant. In fact it is optional "?". Which means it can be there, or it can be empty, so array can be empty
    let children: [Tip]?
    
    
}
