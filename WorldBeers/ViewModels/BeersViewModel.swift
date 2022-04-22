//
//  BeersViewModel.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import Foundation

class BeersViewModel: BaseViewModel {
    var beersLoaded: (([BeerResponse]?, Bool) -> Void)?
    private(set) var beerList: [BeerResponse]?

    override func callService() {
        ApiManager.shared.retrieveBeers { [weak self] response in
            self?.beerList = response
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }

    private func handleResponse(response: [BeerResponse]?, success: Bool) {
        if let beersLoaded = self.beersLoaded {
            beersLoaded(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.beerList?.count ?? 0
    }

    func getBeer(index: Int) -> BeerResponse? {
        return self.beerList?[index]
    }
}
