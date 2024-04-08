//
//  MainTabBarController.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 가운데 탭 바 아이템을 제일 먼저 로드하도록 설정
        self.selectedIndex = 1
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
