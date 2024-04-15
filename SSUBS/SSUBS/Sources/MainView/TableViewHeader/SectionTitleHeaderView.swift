//
//  SectionTitleHeaderView.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/16/24.
//

import UIKit

class SectionTitleHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: SectionTitleHeaderView.self)
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .pretendard(type: .Bold, size: 22)
        label.textAlignment = .left
        label.textColor = .black
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
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func setTitleLabelText(_ title: String) {
        titleLabel.text = title
    }
    
}
