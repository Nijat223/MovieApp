//
//  FavouriteCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 28.12.24.
//

import Foundation
import UIKit.UINavigationController

final class FavouriteCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = FavouriteController(viewModel: .init())
        showController(vc: controller)
    }
}
