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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupTableView() {
        tableView.register(BookmarkBusStationCell.self, forCellReuseIdentifier: BookmarkBusStationCell.identifier)
        tableView.register(SectionTitleHeaderView.self, forHeaderFooterViewReuseIdentifier: SectionTitleHeaderView.identifier)
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
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkBusStationCell.identifier, for: indexPath) as? BookmarkBusStationCell
            else { return BookmarkBusStationCell(style: .default, reuseIdentifier: BookmarkBusStationCell.identifier) }
            cell.selectionStyle = .none
            cell.titleLabel.text = "bus"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkBusStationCell.identifier, for: indexPath) as? BookmarkBusStationCell
            else { return RecentBusStationCell(style: .default, reuseIdentifier: BookmarkBusStationCell.identifier) }
            cell.selectionStyle = .none
            cell.titleLabel.text = "sub"
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension BookmarkMainViewController {
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
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionTitleHeaderView.identifier) as? SectionTitleHeaderView else { return UIView() }
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
