//
//  BookmarkMainViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

class BookmarkMainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchingDataSample()
    }
    
    private func fetchingDataSample() {
        let (x, y) = LocationManager.shared.startUpdatingCurrentLocation()
        
        Task {
            do {
                print(try await NetworkManager.shared.fetchBusStations(keyword: "부산"))
                print(try await NetworkManager.shared.fetchSubwayStations(keyword: "부산"))
                
                print(try await NetworkManager.shared.fetchNearbyBusStations(currentLatitude: x, currentLongitude: y))
                print(try await NetworkManager.shared.fetchNearbySubwayStations(currentLatitude: x, currentLongitude: y))
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // TODO: - Config cell
        
        return cell
    }
}
