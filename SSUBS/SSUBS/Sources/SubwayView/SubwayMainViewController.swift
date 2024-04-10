//
//  SubwayMainViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

class SubwayMainViewController: UIViewController {
    
    let testLabel1: UILabel = {
        let label = UILabel()
        label.text = "테스트 라벨입니다."
        label.font = UIFont.pretendard(type: .Black, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃을 사용하기 위해 필요합니다.
        return label
    }()
    
    let testLabel2: UILabel = {
        let label = UILabel()
        label.text = "테스트 라벨입니다."
        label.font = UIFont.pretendard(type: .Medium, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let testLabel3: UILabel = {
        let label = UILabel()
        label.text = "테스트 라벨입니다."
        label.font = UIFont.pretendard(type: .Light, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 배경색을 흰색으로 설정합니다.
        
        setupLayout()
    }
    
    func setupLayout() {
        // 레이블을 뷰에 추가합니다.
        view.addSubview(testLabel1)
        view.addSubview(testLabel2)
        view.addSubview(testLabel3)
        
        // 오토레이아웃 제약 조건을 설정합니다.
        NSLayoutConstraint.activate([
            // testLabel1을 가운데로 설정하고 상단에 고정합니다.
            testLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            // testLabel2를 testLabel1 아래에 위치시킵니다.
            testLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel2.topAnchor.constraint(equalTo: testLabel1.bottomAnchor, constant: 20),
            
            // testLabel3를 testLabel2 아래에 위치시킵니다.
            testLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel3.topAnchor.constraint(equalTo: testLabel2.bottomAnchor, constant: 20),
        ])
    }
}
