//
//  BusStationViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class BusStationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var busStation: BusStation?
    private var tableView: UITableView!
    var busArrivalDetails: [String: [ArrivalDetails]] = [:]
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        Task {
            await fetchRealTimeInfoForStation()
        }
//        startTimer()
        view.backgroundColor = .white
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func fetchRealTimeInfoForStation() async {
        guard let station = busStation else { return }  // Only check for busStation
        do {
            let response = try await NetworkManager.shared.fetchBusStationRealTime(stationID: "\(station.stationID)")
            DispatchQueue.main.async {
                self.updateUIWithRealTimeData(response: response)
            }
        } catch {
            print("Error fetching real-time data: \(error)")
        }
    }


    func updateUIWithRealTimeData(response: BusArrivalResponse) {
        for busArrival in response.result.real {
            busArrivalDetails[busArrival.routeId] = [busArrival.arrival1, busArrival.arrival2].compactMap { $0 }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busStation?.busInfo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let bus = busStation?.busInfo[indexPath.row],
           let arrivals = busArrivalDetails[bus.busNo] {
            let arrivalTexts = arrivals.map { "\($0.arrivalSec) 초" }.joined(separator: ", ")
            cell.textLabel?.text = "Route \(bus.busNo): \(arrivalTexts)"
        } else {
            cell.textLabel?.text = "Route \(busStation?.busInfo[indexPath.row].busNo ?? "Unknown"): No current arrival info"
        }
        return cell
    }
}
