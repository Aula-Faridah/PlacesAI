//
//  Constant.swift
//  PlacesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Content {
    static let apiKey = "AIzaSyBlDpxgjOuyDjkWHnVHrP0XBoxt0uPT2vM"
    static let prompt = """
    Give me inspiration for activities that can be done during the day in the city of Malang. Provide the response as an array of JSON as 
    {
        [
            "place": "name",
            "activity": "activities",
            "price": "5.000"
        ]
    }
    
    only. Remove any backticks.
    """
}
