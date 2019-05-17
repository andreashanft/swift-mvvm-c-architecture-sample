//
//  UITabBarController+Appearance.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    func applyChrome(_ viewControllers: [UIViewController]) {
        UITabBar.appearance().barTintColor = .black
        
        let foregroundColor = NSAttributedString.Key.foregroundColor
        UITabBarItem.appearance().setTitleTextAttributes([foregroundColor: UIColor.cyan], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([foregroundColor: UIColor.white], for: .normal)
        
        let tabBarTitles: [AppState] = [.dashboard, .settings]
        for (index, controller) in viewControllers.enumerated() {
            controller.tabBarItem = UITabBarItem(title: tabBarTitles[index].rawValue, image: nil, selectedImage: nil)
        }
    }
}
