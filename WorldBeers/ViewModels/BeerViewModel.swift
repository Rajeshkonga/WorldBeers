//
//  BeerViewModel.swift
//  WorldBeers
//
//  Created by Mahesh on 21/04/22.
//

import UIKit

class BeerViewModel: NSObject {
    
    var beer: BeerResponse?
    
    init(beer: BeerResponse?) {
        self.beer = beer
    }
    
    func beerDescription() -> String {
        return beer?.description?.appending(beer?.brewers_tips ?? "") ?? ""
    }
}
