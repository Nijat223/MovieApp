//
//  FavouriteController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 28.12.24.
//

import UIKit

final class FavouriteController: BaseViewController {
    private let viewModel: FavouriteViewModel
    
    init(viewModel: FavouriteViewModel) {
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
