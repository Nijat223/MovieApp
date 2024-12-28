//
//  AppCoordinator.swift
//  MoovieeAPP
//
//  Created by Javidan on 21.12.24.
//

import Foundation
import UIKit.UINavigationController

final class AppCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var isLogin: Bool = false
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMain()
    }
    
    fileprivate func showMain() {
        children.removeAll()
//        let mainTabbar = MainTabBarCoordinator(navigationController: navigationController)
//        children.append(mainTabbar)
//        mainTabbar.parentCoordinator = self
//        mainTabbar.start()
        
    }
    
}

