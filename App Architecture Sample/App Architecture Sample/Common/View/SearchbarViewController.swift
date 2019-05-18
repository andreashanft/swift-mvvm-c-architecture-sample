//
//  SearchbarViewController.swift
//  App Architecture Sample
//
//  Created by Andreas Hanft on 18.05.19.
//  Copyright © 2019 relto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchbarViewController: UIViewController {

    var viewModel: SearchbarViewModel?
    
    @IBOutlet weak var inputTextField: UITextField!
    
    private let disposer = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.placeholderText.asObservable().subscribe(onNext: { [weak self] value in
            self?.inputTextField.placeholder = value
        }).disposed(by: disposer)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        viewModel?.delegate?.textFieldDidChange(to: inputTextField.text)
    }
    
    @IBAction func onCancelButtonPressed(_ sender: Any) {
        viewModel?.delegate?.cancelButtonPressed()
    }
}
