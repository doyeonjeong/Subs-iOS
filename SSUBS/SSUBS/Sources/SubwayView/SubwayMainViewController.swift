import UIKit

class SubwayMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainStationTableView: UITableView! // mainStationTableView 아웃렛 추가
    
    let stations = ["Station 1", "Station 2", "Station 3"] // 예시로 사용할 역 이름 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStationTableView.rowHeight = 80 
        mainStationTableView.dataSource = self
        mainStationTableView.delegate = self
        
        // mainStationViewLabel 설정
                if let mainStationViewLabel = view.viewWithTag(11) as? UILabel {
                    mainStationViewLabel.textColor = .black // 색상 변경
                    mainStationViewLabel.font = UIFont.boldSystemFont(ofSize: 32) // 폰트 변경
                }
                
                // userSearchButton 설정
                if let userSearchButton = view.viewWithTag(33) as? UIButton {
                    userSearchButton.setTitleColor(.black, for: .normal) // 버튼 색상 변경
                    userSearchButton.titleLabel?.font = UIFont.systemFont(ofSize: 18) // 버튼 폰트 변경
                }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainStationcell", for: indexPath)
        
        // 셀 내부의 레이블과 이미지 뷰를 태그를 사용하여 찾고 설정
        let cellOfNearStationLabel = cell.viewWithTag(12) as! UILabel
        cellOfNearStationLabel.text = stations[indexPath.row] // 역 이름 설정
        cellOfNearStationLabel.textColor = .black // 색상 변경
        cellOfNearStationLabel.font = UIFont.systemFont(ofSize: 16) // 폰트 변경
        
        let cellOfNearStationImage = cell.viewWithTag(22) as! UIImageView
        cellOfNearStationImage.image = UIImage(named: "Star rate") // "LineDummy" 이미지 설정
        
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
