//
//  AppState.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation

public enum AppState: String, CaseIterable {
    case dashboard = "Dashboard"
    case settings = "Settings"
    case search = "Search"
    case login = "Login (Not implemented on purpose)"
}
