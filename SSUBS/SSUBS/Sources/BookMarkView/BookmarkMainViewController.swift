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
        
        // 테이블 뷰에 셀 클래스 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 데이터 로딩 함수 호출
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            default:
                return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Bus Stations"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "Subway Stations"
        }
        
        return cell
    }
}
