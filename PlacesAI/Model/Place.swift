//
//  Place.swift
//  PlacesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Place: Codable, Hashable {
    var place, activity, price: String
}

extension Place {
    static let dummyData: [Place] = [
        Place(
            place: "Baso Damas", 
            activity: "Eat meat ball",
            price: "35.000"
        )
    ]
}
