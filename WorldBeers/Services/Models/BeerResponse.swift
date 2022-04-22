//
//  BeerResponse.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import Foundation

class BeerResponse: Decodable {
    let name: String?
    let tagline: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let description: String?
    let brewers_tips: String?
}
