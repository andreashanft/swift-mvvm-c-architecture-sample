//
//  SearchbarViewModel.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 18.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol SearchbarViewModelDelegate: AnyObject {
    func cancelButtonPressed()
    func textFieldDidChange(to newValue: String?)
}

class SearchbarViewModel {
    public weak var delegate: SearchbarViewModelDelegate?
    public var placeholderText = BehaviorRelay(value: "Default Placeholder")
}
