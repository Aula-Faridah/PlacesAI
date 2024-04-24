//
//  Place.swift
//  PlacesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Place: Codable {
    var place, activity, price: String
}

extension Place {
    static let dummyData: [Place] = [
        Place(
            place: "Baso Das", 
            activity: "Eat meat ball",
            price: "35.000"
        )
    ]
}
