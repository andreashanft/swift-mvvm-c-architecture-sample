//
//  DashboardCoordinator.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

class DashboardCoordinator: CoordinatorType, NavigatableChildCoordinator {
    public typealias ControllerType = DashboardViewController
    weak var controllerStorage: DashboardViewController?
    weak var parent: NavigatableCoordinator?

    func instantiateViewController() -> DashboardViewController {
        return DashboardViewController.instantiate()
    }
    
    func navigate(to state: AppState) {
        switch state {
        case .search:
            let container = SwinjectStoryboard.defaultContainer
            let searchCoordinator = container ~> SearchCoordinator.self
            willShow(searchCoordinator)
            viewController.present(searchCoordinator.viewController, animated: true)
        default:
            parent?.navigate(to: state)
        }
    }
}
