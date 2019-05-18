//
//  Coordinator.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit

public protocol RootCoordinator {
    func coordinate(in window: UIWindow?, initialState: AppState)
}

public protocol CoordinatorType: AnyObject {
    associatedtype ControllerType: UIViewController
    
    /**
        Returns the view controller coordinated by this coordinator.
     
        - If the view controller has not yet been created,
        `instantiateViewController()` will be invoked.
        - The default implementation creates a view controller of the type specified
        as `associatedtype` and by calling `init()`.
    */
    var viewController: ControllerType { get }
    
    /**
        Internal property used to store the coordinated view controller.
    
        **Important:** Must be implemented as a **weak** stored property to avoid retain cycles.
     */
    var controllerStorage: ControllerType? { get set }

    func instantiateViewController() -> ControllerType
}

public extension CoordinatorType {
    var viewController: ControllerType {
        if controllerStorage == nil {
            controllerStorage = instantiateViewController()
        }
        return controllerStorage!
    }
    
    func instantiateViewController() -> ControllerType {
       return ControllerType()
    }
    
    func dismiss() {
        viewController.presentingViewController?.dismiss(animated: true)
    }
}

public protocol NavigatableCoordinator: class {
    func navigate(to state: AppState)
    func willShow(_ coordinator: NavigatableChildCoordinator)
}

public protocol NavigatableChildCoordinator: NavigatableCoordinator {
    /// **Important:** Must be implemented as a **weak** stored property to avoid retain cycles.
    var parent: NavigatableCoordinator? { get set }
}

public extension NavigatableCoordinator {
    func willShow(_ coordinator: NavigatableChildCoordinator) {
        coordinator.parent = self
    }
}

public extension NavigatableChildCoordinator {
    func navigate(to state: AppState) {
        guard let parent = parent else {
            print("Child coordinator \(String(describing: self)) has no parent! Did you call 'willShow(childCoordinator)'?")
            return
        }
        parent.navigate(to: state)
    }
}

class SomeCoordinatorImplementation: CoordinatorType, NavigatableChildCoordinator {
    public typealias ControllerType = UITabBarController
    weak var controllerStorage: UITabBarController?
    weak var parent: NavigatableCoordinator?
    
    func instantiateViewController() -> UITabBarController {
        return UITabBarController()
    }
}
