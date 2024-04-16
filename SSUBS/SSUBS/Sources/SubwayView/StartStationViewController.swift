//
//  StartStationViewController.swift
//  SSUBS
//
//  Created by 김수영 on 4/15/24.
//

import UIKit

class StartStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var startStationSearchBar: UISearchBar!
    @IBOutlet weak var startStationTableView: UITableView!
        
        let stations = ["Station 1", "Station 2", "Station 3"] // 예시로 사용할 역 이름 배열
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            startStationTableView.rowHeight = 80
            startStationTableView.dataSource = self
            startStationTableView.delegate = self
            
            // startStationViewLabel 설정
            if let startStationViewLabel = view.viewWithTag(13) as? UILabel {
                startStationViewLabel.textColor = .black // 색상 변경
                startStationViewLabel.font = UIFont.boldSystemFont(ofSize: 32) // 폰트 변경
            }
        }
        
        // MARK: - UITableViewDataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stations.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "startStationCell", for: indexPath)
            
            // 셀 내부의 레이블과 이미지 뷰를 태그를 사용하여 찾고 설정
            let cellOfStartStationLabel = cell.viewWithTag(14) as! UILabel
            cellOfStartStationLabel.text = stations[indexPath.row] // 역 이름 설정
            cellOfStartStationLabel.textColor = .black // 색상 변경
            cellOfStartStationLabel.font = UIFont.systemFont(ofSize: 16) // 폰트 변경
            
            let cellOfStartStationImage = cell.viewWithTag(23) as! UIImageView
            cellOfStartStationImage.image = UIImage(named: "Star_rate") // "LineDummy" 이미지 설정
            
            return cell
        }
        
        // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 선택한 셀의 정보 가져오기
            let selectedStation = stations[indexPath.row]
            
            // 다음 화면으로 이동하기
            if let arrivalStationVC = storyboard?.instantiateViewController(withIdentifier: "arrivalStation") as? ArrivalStationViewController {
                arrivalStationVC.selectedStartStation = selectedStation // 선택한 역 정보 전달
                navigationController?.pushViewController(arrivalStationVC, animated: true)
            }
        }
    }
