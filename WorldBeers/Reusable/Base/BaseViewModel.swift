//
//  BaseViewModel.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import UIKit

class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService()
    }

    public func callService() {
        // childs should implement this
    }
}
