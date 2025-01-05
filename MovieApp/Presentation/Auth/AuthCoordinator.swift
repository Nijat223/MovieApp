//
//  AuthCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
import UIKit.UINavigationController

final class AuthCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
}

//MARK: AuthNavigation

extension AuthCoordinator: AuthNavigation {
    func showRegister() {
        print(#function)
    }
    
}
