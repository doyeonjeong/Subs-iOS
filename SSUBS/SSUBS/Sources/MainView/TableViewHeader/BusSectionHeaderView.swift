//
//  BusSectionHeaderView.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/16/24.
//

import UIKit

class BusSectionHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: BusSectionHeaderView.self)
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .pretendard(type: .SemiBold, size: 18)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private var directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .pretendard(type: .Light, size: 16)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupHeaderView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(directionLabel)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            directionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            directionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            directionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            directionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func setTitleLabelText(_ title: String) {
        titleLabel.text = title
        directionLabel.text = title
    }
    
}
