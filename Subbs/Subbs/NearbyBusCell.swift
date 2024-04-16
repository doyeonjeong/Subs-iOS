//
//  NearbyBusCell.swift
//  Subbs
//
//  Created by doyeonjeong on 4/16/24.
//

import UIKit

class NearbyBusCell: UITableViewCell {
    static let identifier = String(describing: NearbyBusCell.self)

    @IBOutlet weak var stationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
