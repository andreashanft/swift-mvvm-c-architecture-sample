//
//  SearchCoordinator.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: CoordinatorType, NavigatableChildCoordinator {    
    public typealias ControllerType = SearchViewController
    public var controllerStorage: SearchViewController?
    public var parent: NavigatableCoordinator?

    func instantiateViewController() -> SearchViewController {
        return SearchViewController.instantiate()
    }
}
