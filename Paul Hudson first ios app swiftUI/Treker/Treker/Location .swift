//
//  Location .swift
//  Treker
//
//  Created by Petro Strynada on 07.02.2023.
//

import Foundation

//also can be Codable
//Decodable can be only decode in the other hand Codable can be decode and recode
//Identifiable allows to us Location agin and agin and agin and it makes to us uniq instances of that class for every value, so they can be use in a loop
struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
//    let pictures: [String]
    let advisory: String
    
    //for avoid error "Value type 'Location' cannot have a stored property that recursively contains it"
    //add static
    //static means that it exists only once and shares its copy with everyone
    //the nature of error is infinity copping
    static let example = Location(id: 1, name: "The Highlands", country: "United Kingdom", description: "The Highlands is a historic region of Scotland. Culturally, the Highlands and the Lowlands diverged from the later Middle Ages into the modern period, when Lowland Scots replaced Scottish Gaelic throughout most of the Lowlands. The term is also used for the area north and west of the Highland Boundary Fault, although the exact boundaries are not clearly defined, particularly to the east. The Great Glen divides the Grampian Mountains to the southeast from the Northwest Highlands. The Scottish Gaelic name of A' Ghàidhealtachd literally means \"the place of the Gaels\" and traditionally, from a Gaelic-speaking point of view, includes both the Western Isles and the Highlands.", more: "The area is very sparsely populated, with many mountain ranges dominating the region, and includes the highest mountain in the British Isles, Ben Nevis. During the 18th and early 19th centuries the population of the Highlands rose to around 300,000, but from c. 1841 and for the next 160 years, the natural increase in population was exceeded by emigration (mostly to Canada, the United States, Australia and New Zealand, and migration to the industrial cities of Scotland and England.) The area is now one of the most sparsely populated in Europe. At 9.1/km2 (24/sq mi) in 2012, the population density in the Highlands and Islands is less than one seventh of Scotland's as a whole, comparable with that of Bolivia, Chad and Russia.", latitude: 57.1200, longitude: -4.7100, heroPicture: "highlands", advisory: "We accept no liability for any visitors eaten alive by midges.")
}
