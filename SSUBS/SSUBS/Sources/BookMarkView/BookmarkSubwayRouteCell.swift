//
//  BookmarkSubwayRouteCell.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/16/24.
//

import UIKit

class BookmarkSubwayRouteCell: UITableViewCell {
    
    static let identifier = String(describing: BookmarkSubwayRouteCell.self)
    
    lazy var clearBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var containerView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        stack.backgroundColor = .primaryContainer
        stack.layer.cornerRadius = 8
        stack.clipsToBounds = true
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.layer.shadowRadius = 6
        stack.layer.shadowOpacity = 0.15
        return stack
    }()
    
    let startStationLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(type: .Medium, size: 18)
        label.textColor = .black
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()
    
    let endStationLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(type: .Light, size: 16)
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Star rate"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(clearBackgroundView)
        contentView.addSubview(containerView)
        
        containerView.addArrangedSubview(bookmarkButton)
        containerView.addArrangedSubview(startStationLabel)
        containerView.addArrangedSubview(endStationLabel)
        
        NSLayoutConstraint.activate([
            clearBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            clearBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            clearBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            clearBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            bookmarkButton.widthAnchor.constraint(equalToConstant: 44)  // Adjust size as needed
        ])
    }
    
    func configure(with station: BusStation2) {
        startStationLabel.text = station.title + " ▶️"
        endStationLabel.text = station.direction
    }
}
