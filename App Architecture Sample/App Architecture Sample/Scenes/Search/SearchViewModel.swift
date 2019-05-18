//
//  SearchViewModel.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation

class SearchViewModel {
    unowned let coordinator: SearchCoordinator
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func closePressed() {
        coordinator.dismiss()
    }
    
    func unavailableRoutePressed() {
        coordinator.navigate(to: .login)
    }
}
