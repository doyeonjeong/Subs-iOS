//
//  SubwayRouteViewController.swift
//  SSUBS
//
//  Created by 김수영 on 4/15/24.
//

import UIKit

class SubwayRouteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedBookMark: String?
    var selectedStartStation: String?
    var selectedArrivalStation: String?
    
    @IBOutlet weak var routeTableView: UITableView!
    @IBOutlet weak var timeSelectButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var travelTimeLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    
    let routes = ["노선 1", "노선 2", "노선 3", "노선 4", "노선 5"]
    
    // 피커 뷰의 데이터
    let weekdays = ["평일", "주말"]
    let hours = Array(0...23)
    let minutes = Array(0...59)
    
    var selectedWeekday: String = "평일"
    var selectedHour: Int = 0
    var selectedMinute: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        routeTableView.dataSource = self
        routeTableView.delegate = self
        
        travelTimeLabel.text = "약 30분"
        
        updateTimeSelectButtonTitle()
    }
    
    var updateTime: Date?
    
    func updateTimeSelectButtonTitle() {
        let date = updateTime ?? Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday, .hour, .minute], from: date)
        
        // 요일
          let weekday = components.weekday ?? 1
          if weekday >= 2 && weekday <= 6 {
              selectedWeekday = "평일"
          } else {
              selectedWeekday = "주말"
          }
        
        // 시간
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        selectedHour = hour
        selectedMinute = minute
        
        
        // 버튼 타이틀
        let formattedTime = String(format: "출발시간. %02d:%02d", selectedHour, selectedMinute)
        timeSelectButton.setTitle(formattedTime, for: .normal)
        
        
        print(formattedTime)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "metroRoute", for: indexPath)
        cell.textLabel?.text = routes[indexPath.row]
        if let viewToRound = cell.viewWithTag(99) {
            let size = min(viewToRound.frame.width, viewToRound.frame.height)
            viewToRound.layer.cornerRadius = size / 2
            viewToRound.clipsToBounds = true
        }
        return cell
    }
    
    @IBAction func actStarButton(_ sender: Any) {
        if let button = sender as? UIButton {
            button.isSelected = !button.isSelected
            if button.isSelected {
                button.setImage(UIImage(named: "Star rate"), for: .normal)
                // 변경된 상태 저장 로직 (예: UserDefaults 사용)
            } else {
                button.setImage(UIImage(named: "Star border"), for: .normal)
                // 변경된 상태 저장 로직 (예: UserDefaults 사용)
            }
        }
    }
    
    @IBAction func actTimeSelectButton(_ sender: Any) {
        
        // Alert 생성
        let alert = UIAlertController(title: "시간 선택", message: nil, preferredStyle: .alert)
        
        // 피커 뷰 생성
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 피커 뷰 추가
        alert.view.addSubview(pickerView)
        
        // 피커 뷰에 오토레이아웃 설정
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 50).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 20).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -20).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -50).isActive = true
        
        // 현재 시간을 기본값으로 설정
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        pickerView.selectRow(hour, inComponent: 2, animated: true)
        pickerView.selectRow(minute, inComponent: 3, animated: true)
        
        
        // 확인 버튼 추가
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
            // 사용자가 확인 버튼을 누른 경우 선택한 값을 적용하고 화면에 반영
            self.updateTimeSelectButtonTitle()
        }))
        
        // 취소 버튼 추가
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // Alert 표시
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // 요일, 시간, 분
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return weekdays.count
        case 1:
            return hours.count
        case 2:
            return minutes.count
        default:
            return 0
        }
    }
    
    // MARK: - UIPickerViewDelegate
          
          func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              switch component {
              case 0:
                  return weekdays[row]
              case 1:
                  return "\(hours[row])시"
              case 2:
                  return "\(minutes[row])분"
              default:
                  return nil
              }
          }
          
          func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
              switch component {
              case 0:
                  selectedWeekday = weekdays[row]
              case 1:
                  selectedHour = hours[row]
              case 2:
                  selectedMinute = minutes[row]
              default:
                  break
              }
              // 선택한 시간을 updateTime에 저장
                let calendar = Calendar.current
                var components = calendar.dateComponents([.year, .month, .day], from: Date())
                components.hour = selectedHour
                components.minute = selectedMinute
                updateTime = calendar.date(from: components)
                
              updateTimeSelectButtonTitle()
          }
      }
