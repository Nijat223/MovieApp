//
//  PersonController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 06.01.25.
//

import UIKit

final class PersonController: BaseViewController {
    private let viewModel: PersonViewModel
    
    init(viewModel: PersonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

}
