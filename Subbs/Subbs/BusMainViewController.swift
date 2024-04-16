//
//  BusMainViewController.swift
//  Subbs
//
//  Created by doyeonjeong on 4/16/24.
//

import UIKit

class BusMainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stations = ["역곡남부역", "소사역", "범박고등학교"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Setup
extension BusMainViewController {
    private func setupTableView() {
        tableView.register(NearbyBusCell.self, forCellReuseIdentifier: NearbyBusCell.identifier)
    }
}

// MARK: - Custom Method
extension BusMainViewController {
    @IBAction func tappedSearchButton(_ sender: UIButton) {}
}

// MARK: - UITableViewDataSource
extension BusMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NearbyBusCell.identifier, for: indexPath) as? NearbyBusCell else { return NearbyBusCell(style: .default, reuseIdentifier: NearbyBusCell.identifier) }
        cell.stationNameLabel.text = stations[indexPath.row]
        return cell
    }
    
    
}
