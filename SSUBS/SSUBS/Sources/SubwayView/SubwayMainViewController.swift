import UIKit

class SubwayMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var mainStationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let stations = ["Station 1", "Station 2", "Station 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainStationTableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStationTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStationTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainStationTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainStationTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func handleSearch() {
        // 검색 버튼 눌렀을 때의 동작
        print("Search button tapped")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainStationcell", for: indexPath)
        
        // 셀 설정
        cell.textLabel?.text = stations[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textColor = .black
        cell.imageView?.image = UIImage(named: "Star rate") // 이미지는 Asset에 추가되어 있어야 함
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStation = stations[indexPath.row]
        print("Selected station: \(selectedStation)")
        // 다음 화면으로의 이동이나 다른 액션을 이곳에서 구현
    }
}
