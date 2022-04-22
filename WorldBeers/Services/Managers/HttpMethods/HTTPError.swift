//
//  HTTPError.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import Foundation

enum HTTPError: Error {
    case urlFailed
    case noData
    case requestError
    case parsingFailed
}
