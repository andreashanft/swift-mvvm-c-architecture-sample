//
//  Dependencies.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

public func registerDependencies() {
    let container = SwinjectStoryboard.defaultContainer
    
    container.autoregister(DashboardCoordinator.self, initializer: DashboardCoordinator.init).inObjectScope(.container)
    container.autoregister(SettingsCoordinator.self, initializer: SettingsCoordinator.init).inObjectScope(.container)
    container.autoregister(SearchCoordinator.self, initializer: SearchCoordinator.init).inObjectScope(.container)

    container.storyboardInitCompleted(DashboardViewController.self) { resolver, controller in
        controller.viewModel = resolver ~> DashboardViewModel.self
    }
    container.autoregister(DashboardViewModel.self, initializer: DashboardViewModel.init)

    container.storyboardInitCompleted(SearchViewController.self) { resolver, controller in
        controller.viewModel = resolver ~> SearchViewModel.self
    }
    container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)

    container.storyboardInitCompleted(SettingsViewController.self) { resolver, controller in
        controller.viewModel = resolver ~> SettingsViewModel.self
    }
    container.autoregister(SettingsViewModel.self, initializer: SettingsViewModel.init)
}
