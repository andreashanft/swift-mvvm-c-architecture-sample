//
//  SearchViewModel.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    unowned let coordinator: SearchCoordinator
    
    weak var searchBarViewModel: SearchbarViewModel? {
        didSet {
            searchBarViewModel?.delegate = self
        }
    }
    
    var inputText = BehaviorRelay(value: "")
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func changePlaceholderPressed() {
        let date = Date()
        searchBarViewModel?.placeholderText.accept(String(describing: date))
    }
    
    func closePressed() {
        coordinator.dismiss()
    }
    
    func unavailableRoutePressed() {
        coordinator.navigate(to: .login)
    }
}

extension SearchViewModel: SearchbarViewModelDelegate {
    func textFieldDidChange(to newValue: String?) {
        if let text = newValue {
            inputText.accept(text)
        }
    }
    
    func cancelButtonPressed() {
        coordinator.dismiss()
    }
}
