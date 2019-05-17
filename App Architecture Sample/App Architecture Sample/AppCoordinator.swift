//
//  AppCoordinator.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

class AppCoordinator: CoordinatorType, NavigatableCoordinator {
    public typealias ControllerType = UITabBarController
    public var controllerStorage: UITabBarController?

    public func instantiateViewController() -> UITabBarController {
        let container = SwinjectStoryboard.defaultContainer
        let dashboardCoordinator = container ~> DashboardCoordinator.self
        let settingsCoordinator = container ~> SettingsCoordinator.self
        
        let controller = UITabBarController()
        let viewControllers = [
            dashboardCoordinator.viewController,
            settingsCoordinator.viewController]
        controller.applyChrome(viewControllers)
        controller.viewControllers = viewControllers
        
        return controller
    }
    
    func navigate(to state: AppState) {
        switch state {
        case .dashboard:
            viewController.selectedIndex = 0
        case .settings:
            viewController.selectedIndex = 1
        default:
            fatalError("No route to state \(state.rawValue) available")
        }
    }
}

extension AppCoordinator: RootCoordinator {
    
    public func coordinate(in window: UIWindow?, initialState: AppState) {
        if let window = window {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            navigate(to: initialState)
        }
    }
}
