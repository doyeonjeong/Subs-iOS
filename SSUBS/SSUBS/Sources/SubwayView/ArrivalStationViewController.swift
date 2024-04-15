//
//  ArrivalStationViewController.swift
//  SSUBS
//
//  Created by 김수영 on 4/15/24.
//

import UIKit


class ArrivalStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var arrivalStationSearchBar: UISearchBar!
    @IBOutlet weak var arrivalStationTableView: UITableView!
    
    
    var selectedStartStation: String?
   
    
    let stations = ["Station 1", "Station 2", "Station 3"] // 예시로 사용할 역 이름 배열
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            arrivalStationTableView.rowHeight = 80
            arrivalStationTableView.dataSource = self
            arrivalStationTableView.delegate = self
            
            // startStationViewLabel 설정
            if let arrivalStationViewLabel = view.viewWithTag(15) as? UILabel {
                arrivalStationViewLabel.textColor = .black // 색상 변경
                arrivalStationViewLabel.font = UIFont.boldSystemFont(ofSize: 32) // 폰트 변경
            }
        }
        
   
    // MARK: - UITableViewDataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stations.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "arrivalStationCell", for: indexPath)
            
            // 셀 내부의 레이블과 이미지 뷰를 태그를 사용하여 찾고 설정
            let cellOfStartStationLabel = cell.viewWithTag(16) as! UILabel
            cellOfStartStationLabel.text = stations[indexPath.row] // 역 이름 설정
            cellOfStartStationLabel.textColor = .black // 색상 변경
            cellOfStartStationLabel.font = UIFont.systemFont(ofSize: 16) // 폰트 변경
            
            let cellOfStartStationImage = cell.viewWithTag(24) as! UIImageView
            cellOfStartStationImage.image = UIImage(named: "Star rate") // "LineDummy" 이미지 설정
            
            return cell
        }
        
    // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 선택한 셀의 정보 가져오기
            let selectedStation = stations[indexPath.row]
            
            // 다음 화면으로 이동하기
                if let subwayRouteVC = storyboard?.instantiateViewController(withIdentifier: "subwayRoute") as? SubwayRouteViewController {
                    subwayRouteVC.selectedArrivalStation = selectedStation // 선택한 역 정보 전달
                    navigationController?.pushViewController(subwayRouteVC, animated: true)
                }
        }
    }
