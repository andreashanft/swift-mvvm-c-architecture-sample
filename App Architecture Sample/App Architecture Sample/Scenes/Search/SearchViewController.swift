//
//  SearchViewController.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import UIKit
import Reusable

class SearchViewController: UIViewController, StoryboardBased {
    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClosePressed(_ sender: Any) {
        viewModel?.closePressed()
        view.backgroundColor = .gray
    }
    
    @IBAction func onOpenUnavailableRoute(_ sender: Any) {
        viewModel?.unavailableRoutePressed()
    }
}
