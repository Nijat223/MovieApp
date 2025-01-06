//
//  PersonCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 06.01.25.
//

import Foundation
import UIKit.UINavigationController

final class PersonCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = PersonController(viewModel: .init())
        showController(vc: controller)
    }
}
