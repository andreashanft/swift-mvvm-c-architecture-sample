//
//  SettingsCoordinator.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class SettingsCoordinator: CoordinatorType, NavigatableChildCoordinator {
    public typealias ControllerType = UINavigationController
    public var controllerStorage: UINavigationController?
    public var parent: NavigatableCoordinator?

    func instantiateViewController() -> UINavigationController {
        let settingsController = SettingsViewController.instantiate()
        return UINavigationController(rootViewController: settingsController)
    }
}
