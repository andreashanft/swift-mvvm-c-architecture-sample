//
//  SearchViewController.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 17.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

class SearchViewController: UIViewController, StoryboardBased {
    var viewModel: SearchViewModel?
    
    @IBOutlet weak var inputMirrorLabel: UILabel!
    
    private var searchbarViewController: SearchbarViewController?
    private var disposer = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        children.forEach { controller in
            if let controller = controller as? SearchbarViewController {
                searchbarViewController = controller
                viewModel?.searchBarViewModel = controller.viewModel
            }
        }
        
        viewModel?.inputText.asObservable().bind(to: inputMirrorLabel.rx.text).disposed(by: disposer)
    }
    
    
    @IBAction func onChangePlaceholderPressed(_ sender: Any) {
        viewModel?.changePlaceholderPressed()
    }
    
    @IBAction func onOpenUnavailableRoute(_ sender: Any) {
        viewModel?.unavailableRoutePressed()
    }
}
