//
//  SearchCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 06.01.25.
//

import Foundation
import Foundation
import UIKit.UINavigationController

final class SearchCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SearchController(viewModel: .init())
        showController(vc: controller)
    }
}
