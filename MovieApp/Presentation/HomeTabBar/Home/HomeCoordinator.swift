//
//  HomeCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 27.12.24.
//

import Foundation
import UIKit.UINavigationController

final class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeController(viewModel: .init())
        showController(vc: controller)
    }
} 
