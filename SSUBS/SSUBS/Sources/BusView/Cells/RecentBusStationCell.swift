//
//  RecentBusStationCell.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class RecentBusStationCell: UITableViewCell {
    
    static let identifier = String(describing: RecentBusStationCell.self)
    
    lazy var clearBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .primaryContainer
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.layer.masksToBounds = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Medium, size: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Light, size: 14)
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let backgroundView = UIView(frame: CGRect(x: 0, y: 10, width: self.frame.width, height: self.frame.height - 20))
            backgroundView.backgroundColor = .white // 배경색은 셀의 배경색과 동일하게 설정합니다.
            self.backgroundView = backgroundView
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Setup Methods
extension RecentBusStationCell {
    private func setup() {
        // 그림자 설정
        self.backgroundColor = .clear // 셀 자체의 배경색을 투명하게 설정합니다.
        
        
        contentView.addSubview(clearBackgroundView)
        contentView.backgroundColor = .clear // contentView의 배경색도 투명하게 설정합니다.
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true // contentView 내부의 컨텐츠가 둥근 모서리를 넘지 않도록 합니다.
        
        clearBackgroundView.addSubview(titleLabel)
        clearBackgroundView.addSubview(directionLabel)
        
        setupConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(clearBackgroundView)
        clearBackgroundView.addSubview(titleLabel)
        clearBackgroundView.addSubview(directionLabel)
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                clearBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                clearBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                clearBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                clearBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                
                titleLabel.topAnchor.constraint(equalTo: clearBackgroundView.topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: clearBackgroundView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: clearBackgroundView.trailingAnchor, constant: -16),
                
                directionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                directionLabel.leadingAnchor.constraint(equalTo: clearBackgroundView.leadingAnchor, constant: 16),
                directionLabel.trailingAnchor.constraint(equalTo: clearBackgroundView.trailingAnchor, constant: -16),
                directionLabel.bottomAnchor.constraint(equalTo: clearBackgroundView.bottomAnchor, constant: -16)
            ])
        }

}

extension RecentBusStationCell {
    func config(_ station: BusStation2) {
        titleLabel.text = station.title
        directionLabel.text = station.direction
    }
}
