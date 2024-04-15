//
//  BusStationViewController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

class BusStationViewController: UIViewController {
    
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let text = text else { return }
        print(text)
        view.backgroundColor = .surface
    }
}
