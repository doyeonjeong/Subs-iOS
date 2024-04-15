//
//  SearchBusStationCell.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/16/24.
//

import UIKit

class SearchBusStationCell: UITableViewCell {
    static let identifier = String(describing: SearchBusStationCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.textLabel?.textColor = .darkGray
        self.selectionStyle = .blue
    }
    
    func configure(with text: String) {
        self.textLabel?.text = text
    }
}
