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
    weak var controllerStorage: UITabBarController?
    
    private var dashboardCoordinator: DashboardCoordinator
    private var settingsCoordinator: SettingsCoordinator
    
    init(container: Container = SwinjectStoryboard.defaultContainer) {
        dashboardCoordinator = container ~> DashboardCoordinator.self
        settingsCoordinator = container ~> SettingsCoordinator.self
    }

    public func instantiateViewController() -> UITabBarController {
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
            willShow(dashboardCoordinator)
            viewController.selectedIndex = 0
        case .settings:
            willShow(settingsCoordinator)
            viewController.selectedIndex = 1
        default:
            fatalError("No route to AppState '\(state.rawValue)' available")
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
