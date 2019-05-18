//
//  DashboardViewController.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import UIKit
import Reusable

class DashboardViewController: UIViewController, StoryboardBased {
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onOpenSearchPressed(_ sender: Any) {
        viewModel?.openSearchPressed()
    }
}
