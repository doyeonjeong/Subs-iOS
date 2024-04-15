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
    
    lazy var routeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "metroRoute")
        return tableView
    }()
    
    lazy var timeSelectButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Time", for: .normal)
        button.addTarget(self, action: #selector(actTimeSelectButton), for: .touchUpInside)
        return button
    }()
    
    lazy var starButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("★", for: .normal)
        button.addTarget(self, action: #selector(actStarButton), for: .touchUpInside)
        return button
    }()
    
    lazy var travelTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Travel Time: 약 30분"  // Initial text with default travel time
        return label
    }()
    
    lazy var timeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time"
        return label
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    let routes = ["노선 1", "노선 2", "노선 3", "노선 4", "노선 5"]
    let weekdays = ["평일", "주말"]
    let hours = Array(0...23)
    let minutes = Array(0...59)
    
    var selectedWeekday: String = "평일"
    var selectedHour: Int = 0
    var selectedMinute: Int = 0
    var updateTime: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateTimeSelectButtonTitle()
    }
    
    private func setupUI() {
        view.addSubview(routeTableView)
        view.addSubview(timeSelectButton)
        view.addSubview(starButton)
        view.addSubview(travelTimeLabel)
        view.addSubview(timeTitleLabel)
        view.addSubview(pickerView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            routeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            routeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            routeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            routeTableView.bottomAnchor.constraint(equalTo: timeSelectButton.topAnchor, constant: -10),
            
            timeSelectButton.heightAnchor.constraint(equalToConstant: 50),
            timeSelectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeSelectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeSelectButton.bottomAnchor.constraint(equalTo: starButton.topAnchor, constant: -10),
            
            starButton.heightAnchor.constraint(equalToConstant: 50),
            starButton.widthAnchor.constraint(equalToConstant: 50),
            starButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            starButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    // TableView DataSource and Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "metroRoute", for: indexPath)
        cell.textLabel?.text = routes[indexPath.row]
        return cell
    }
    
    // UIPickerView DataSource and Delegate methods
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return weekdays[row] // Return the weekday based on the row index
        case 1:
            return "\(hours[row])시" // Return the hour suffixed with '시', which stands for 'hour' in Korean
        case 2:
            return "\(minutes[row])분" // Return the minute suffixed with '분', which stands for 'minute' in Korean
        default:
            return nil // If an unexpected component is queried, return nil
        }
    }
    
    // Method to update the title of the time select button
    @objc func updateTimeSelectButtonTitle() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"  // Setting the format for the time
        let timeString = formatter.string(from: updateTime ?? Date())  // Using current time if updateTime is nil
        let title = "출발시간: \(timeString)"
        timeSelectButton.setTitle(title, for: .normal)
    }
    
    // Method triggered by the star button
    @objc func actStarButton(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitle("★", for: .normal)
            //saveBookMark()  // Function to handle bookmark saving
        } else {
            sender.setTitle("☆", for: .normal)
            //removeBookMark()  // Function to handle removing bookmark
        }
    }
    
    // Method triggered by the time select button
    @objc func actTimeSelectButton(_ sender: UIButton) {
        // Method to display a picker or action sheet to select time
        let alert = UIAlertController(title: "시간 선택", message: nil, preferredStyle: .actionSheet)
        alert.view.addSubview(pickerView)
        
        // Constraints for pickerView within the alert
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
            pickerView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
            pickerView.widthAnchor.constraint(equalTo: alert.view.widthAnchor, multiplier: 0.9),
            pickerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -45)
        ])
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.updateTimeSelectButtonTitle()
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(alert, animated: true, completion: nil)
    }
}
