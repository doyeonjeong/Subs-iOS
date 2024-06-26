//
//  BusStationCarouselCell.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class BusStationCarouselCell: UICollectionViewCell {
    
    static let identifier = String(describing: BusStationCarouselCell.self)
    
    lazy var clearBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let containerView: UIView = {
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Medium, size: 18)
        label.textColor = .black
        return label
    }()
    
    let directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Light, size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(clearBackgroundView)
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(directionLabel)
        
        NSLayoutConstraint.activate([
            clearBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            clearBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            clearBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            clearBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            directionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            directionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            directionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            directionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with station: BusStation2) {
        titleLabel.text = station.title
        directionLabel.text = station.direction
    }
}
