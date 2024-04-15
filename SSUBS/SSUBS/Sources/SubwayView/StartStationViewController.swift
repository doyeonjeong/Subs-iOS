//
//  StartStationViewController.swift
//  SSUBS
//
//  Created by 김수영 on 4/15/24.
//

import UIKit

class StartStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Lazy initialization of UISearchBar
    lazy var startStationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    // Lazy initialization of UITableView
    lazy var startStationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "startStationCell")
        return tableView
    }()
    
    let stations = ["Station 1", "Station 2", "Station 3"] // Sample station names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupTableView()
        setupViewLabel()
    }
    
    private func setupSearchBar() {
        view.addSubview(startStationSearchBar)
        NSLayoutConstraint.activate([
            startStationSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            startStationSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startStationSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(startStationTableView)
        NSLayoutConstraint.activate([
            startStationTableView.topAnchor.constraint(equalTo: startStationSearchBar.bottomAnchor),
            startStationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startStationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startStationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupViewLabel() {
        let startStationViewLabel = UILabel()
        startStationViewLabel.textColor = .black
        startStationViewLabel.font = UIFont.boldSystemFont(ofSize: 32)
        startStationViewLabel.text = "Main Stations"
        startStationViewLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startStationViewLabel)
        NSLayoutConstraint.activate([
            startStationViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startStationViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "startStationCell", for: indexPath)
        cell.textLabel?.text = stations[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textColor = .black
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected station: \(stations[indexPath.row])")
        // Handle cell selection, push new view controller, etc.
    }
}
