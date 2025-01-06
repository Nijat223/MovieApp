//
//  HomeTabBarCoordinator.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 27.12.24.
//

import UIKit
final class HomeTabBarCoordinator : Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    private let tabBarController = TabBarController()
    
    private var homeCoordinator: HomeCoordinator?
    private var favouriteCoordinator: FavouriteCoordinator?
    private var searchCoordinator: SearchCoordinator?


    
    init(
        navigationController : UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        initializeHomeTabBar()
    }
    
    deinit {
        print(#function)
    }
    
    private func initializeHomeTabBar() {
        //MARK: Create the TabBar item for TabBar.
        let homeNavigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        // we want to home coordinator connected to the App Coordinator, because the HomeTabBar coordinator only serves as a container.
        homeCoordinator?.parentCoordinator = parentCoordinator
        // Setup for home tab
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(systemName: "house")
        homeItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        
        let favNavController = UINavigationController()
        favouriteCoordinator = FavouriteCoordinator(navigationController: favNavController)
        favouriteCoordinator?.parentCoordinator = parentCoordinator
        
        // Setup for fav tab
        let favItem = UITabBarItem()
        favItem.title = "Favourite"
        favItem.image = UIImage(systemName: "heart")
        favItem.selectedImage = UIImage(systemName: "heart.fill")
        favNavController.tabBarItem = favItem
        
        
        let searchNavController = UINavigationController()
        searchCoordinator = SearchCoordinator(navigationController: searchNavController)
        // we want to home coordinator connected to the App Coordinator, because the HomeTabBar coordinator only serves as a container.
        searchCoordinator?.parentCoordinator = parentCoordinator
        // Setup for home tab
        let searchItem = UITabBarItem()
        searchItem.title = "Search"
        searchItem.image = UIImage(systemName: "magnifyingglass")
        searchItem.selectedImage = UIImage(systemName: "magnifyingglass")
        searchNavController.tabBarItem = searchItem
       
        
        tabBarController.viewControllers = [
            homeNavigationController,
            favNavController,
            searchNavController
        ]
        
        navigationController.pushViewController(tabBarController, animated: true)
//        navigationController.setNavigationBarHidden(false, animated: true)
        
        // Add the coordinator into parent's child
        parentCoordinator?.children.append(
            homeCoordinator ?? HomeCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append(
            favouriteCoordinator ?? FavouriteCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append(
            searchCoordinator ?? SearchCoordinator(navigationController: UINavigationController())
        )
        homeCoordinator?.start()
        favouriteCoordinator?.start()
        searchCoordinator?.start()
    }
}
