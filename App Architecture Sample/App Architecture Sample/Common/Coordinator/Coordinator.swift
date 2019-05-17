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

public protocol CoordinatorType: class {
    associatedtype ControllerType: UIViewController
    
    var viewController: ControllerType { get }
    var controllerStorage: ControllerType? { get set }

    func resetViewController()
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
    
    func resetViewController() {
        controllerStorage = nil
    }
}

public protocol NavigatableCoordinator {
    func navigate(to state: AppState)
}

public protocol NavigatableChildCoordinator: NavigatableCoordinator {
    var parent: NavigatableCoordinator? { get set }
}

public extension NavigatableChildCoordinator {
    func navigate(to state: AppState) {
        if let parent = parent {
            parent.navigate(to: state)
        }
    }
}

class SomeCoordinatorImplementation: CoordinatorType, NavigatableChildCoordinator {
    public typealias ControllerType = UITabBarController
    public var controllerStorage: UITabBarController?
    public var parent: NavigatableCoordinator?
    
    public func instantiateViewController() -> UITabBarController {
        return UITabBarController()
    }
}
