//
//  BusMainViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

class BusMainViewController: UITableViewController {
    
    var buses: [BusStation2] = [
        BusStation2(title: "(10101)정류장 A", direction: "동쪽 방향"),
        BusStation2(title: "(10102)정류장 B", direction: "서쪽 방향"),
        BusStation2(title: "(10103)정류장 C", direction: "남쪽 방향"),
        BusStation2(title: "(10104)정류장 D", direction: "북쪽 방향")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .surface
        
        setupTableView()
        setupSearchIcon()
    }
    
}

// MARK: - setup
extension BusMainViewController {
    private func setupSearchIcon() {
        let searchIcon = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchIcon))
        self.navigationItem.rightBarButtonItem = searchIcon
    }
    
    @objc private func didTapSearchIcon() {
        let searchController = BusSearchViewController() // 검색을 처리할 뷰 컨트롤러 인스턴스
        navigationController?.pushViewController(searchController, animated: true)
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(BusListHeaderView.self, forHeaderFooterViewReuseIdentifier: BusListHeaderView.identifier)
        tableView.register(NearbyBusStationCell.self, forCellReuseIdentifier: NearbyBusStationCell.identifier)
        tableView.register(RecentBusStationCell.self, forCellReuseIdentifier: RecentBusStationCell.identifier)
    }
}


// MARK: - UITableViewDataSource
extension BusMainViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return buses.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearbyBusStationCell.identifier, for: indexPath) as? NearbyBusStationCell
            else { return NearbyBusStationCell(style: .default, reuseIdentifier: NearbyBusStationCell.identifier) }
            cell.buses = buses
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentBusStationCell.identifier, for: indexPath) as? RecentBusStationCell
            else { return RecentBusStationCell(style: .default, reuseIdentifier: RecentBusStationCell.identifier) }
            cell.selectionStyle = .none
            cell.config(buses[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension BusMainViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 130
        case 1: return 100
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: BusListHeaderView.identifier) as? BusListHeaderView else { return UIView() }
        switch section {
        case 0:
            headerView.setTitleLabelText("주변 정류장")
            return headerView
        case 1:
            headerView.setTitleLabelText("최근 검색어")
            return headerView
        default:
            return UIView()
        }
    }
}
