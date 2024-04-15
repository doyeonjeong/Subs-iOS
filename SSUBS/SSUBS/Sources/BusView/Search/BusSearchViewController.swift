//
//  BusSearchViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class BusSearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var searchBar: UISearchBar!
    private var stations: [BusStation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        
        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        title = "Search"
    }
    
    private func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search for a bus station."
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .systemBlue
        navigationItem.titleView = searchBar
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchBusStationCell.self, forCellReuseIdentifier: SearchBusStationCell.identifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // Set a fixed height for each cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = BusStationViewController()
        vc.busStation = stations[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchBusStationCell.identifier, for: indexPath) as! SearchBusStationCell
        let station = stations[indexPath.row]
        cell.configure(with: station.stationName)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            fetchStations(keyword: searchText)
        }
        searchBar.resignFirstResponder()
    }
    
    private func fetchStations(keyword: String) {
        Task {
            do {
                let result = try await NetworkManager.shared.fetchBusStations(keyword: keyword, displayCount: 20)
                self.stations = result.result.stations
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error fetching stations: \(error)")
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "Failed to fetch stations: \(error.localizedDescription)")
                }
            }
        }
    }
}

