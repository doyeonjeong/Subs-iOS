//
//  BusStationCarouselCell.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class BusStationCarouselCell: UICollectionViewCell {

    static let identifier = String(describing: BusStationCarouselCell.self)

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Medium, size: 16)
        label.textColor = .black
        return label
    }()

    let directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .pretendard(type: .Light, size: 14)
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        self.backgroundColor = .primaryContainer
        self.layer.cornerRadius = 8
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(titleLabel)
        addSubview(directionLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            directionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            directionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            directionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            directionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }

    func configure(with station: BusStation2) {
        titleLabel.text = station.title
        directionLabel.text = station.direction
    }

}

