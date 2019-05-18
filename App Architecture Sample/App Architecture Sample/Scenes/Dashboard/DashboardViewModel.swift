//
//  DashboardViewModel.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation

class DashboardViewModel {
    unowned let coordinator: DashboardCoordinator
    
    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
    }
    
    func openSearchPressed() {
        coordinator.navigate(to: .search)
    }
}
