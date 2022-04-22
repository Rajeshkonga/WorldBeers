//
//  HomeViewController.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import UIKit

private let segueIdentifer = "detailSegue"
private let screenTitle = "Beers"

class HomeViewController: BaseViewController {
    private var beersViewModel = BeersViewModel()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showLoader()
        self.beersViewModel.beersLoaded = { [weak self] (_, success) in
            self?.hideLoader()
            if success {
                self?.tableView.reloadData()
            } else {

            }
        }
    }

    private func setupUI() {
        self.title = screenTitle
        self.tableView.registerCell(type: BeerTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beersViewModel.numberOrRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: BeerTableViewCell.self, for: indexPath) as? BeerTableViewCell, let beerData = self.beersViewModel.getBeer(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setBeerData(beerData: beerData)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let beer = self.beersViewModel.getBeer(index: indexPath.row) else { return }
        self.performSegue(withIdentifier: segueIdentifer, sender: beer)
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifer {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.beerviewModel = BeerViewModel(beer: sender as? BeerResponse)
            }
        }
    }
}
