//
//  DetailViewController.swift
//  WorldBeers
//
//  Created by Mahesh on 21/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var beerDescriptionLbl: UILabel?
    @IBOutlet private weak var imgBeer: UIImageView?
    var beerviewModel: BeerViewModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    private func updateUI() {
        beerDescriptionLbl?.text = beerviewModel?.beerDescription()
        if let url = URL(string: beerviewModel?.beer?.image_url ?? "") {
            imgBeer?.sd_setImage(with: url, completed: nil)
        }
    }
    
}
