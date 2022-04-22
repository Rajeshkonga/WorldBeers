//
//  ApiManager.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import Foundation

class ApiManager {
    public static let shared = ApiManager()
    
    func retrieveBeers(success: @escaping (([BeerResponse]) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        ServiceManager.shared.callService(urlString: Constants.BEERS_URL, method: .get) { (result: Result<[BeerResponse], HTTPError>) in
            switch result {
            case .success(let beerResponse):
                success(beerResponse)
            case .failure(let httpError):
                fail(httpError)
            }
        }
    }
}
