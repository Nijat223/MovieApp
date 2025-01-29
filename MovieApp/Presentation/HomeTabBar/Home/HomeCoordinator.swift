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
        let controller = HomeController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
} 

extension HomeCoordinator: HomeNavigation {
    func showMovieDetail(detail: MovieDetail) {
        let controller = MovieDetailController(viewModel: .init(navigation: self, movieDetail: detail))
        controller.hidesBottomBarWhenPushed = true
//        navigationController.setNavigationBarHidden(true, animated: false)
        showController(vc: controller)
    }
    
    func showTrailer(url: String) {
        showWebPage(with: url)
    }
    
}
