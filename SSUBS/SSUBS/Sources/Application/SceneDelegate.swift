//
//  SceneDelegate.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Main TabBarController 인스턴스 생성
        let tabBarController = MainTabBarController()

        // 각 탭에 대응하는 뷰 컨트롤러 생성 및 내비게이션 컨트롤러 설정
        let firstVC = BusMainViewController()
        let firstNavController = UINavigationController(rootViewController: firstVC)

        let secondVC = BookmarkMainViewController()
        let secondNavController = UINavigationController(rootViewController: secondVC)

        let thirdVC = SubwayMainViewController()
        let thirdNavController = UINavigationController(rootViewController: thirdVC)

        // 아이콘 크기 조절
        let desiredSize = CGSize(width: 30, height: 30) // 원하는 크기로 설정
        let busIcon = UIImage(named: "Bus")?.resized(to: desiredSize)
        let bookmarksIcon = UIImage(named: "Bookmarks")?.resized(to: desiredSize)
        let subwayIcon = UIImage(named: "Subway")?.resized(to: desiredSize)

        firstVC.tabBarItem = UITabBarItem(title: nil, image: busIcon, selectedImage: busIcon)
        secondVC.tabBarItem = UITabBarItem(title: nil, image: bookmarksIcon, selectedImage: bookmarksIcon)
        thirdVC.tabBarItem = UITabBarItem(title: nil, image: subwayIcon, selectedImage: subwayIcon)

        // 탭 바에 내비게이션 컨트롤러 추가
        tabBarController.viewControllers = [firstNavController, secondNavController, thirdNavController]
        tabBarController.selectedIndex = 1

        // Window 설정 및 표시
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
