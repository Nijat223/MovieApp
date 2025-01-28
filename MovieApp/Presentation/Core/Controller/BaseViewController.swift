//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 24.12.24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = "Flux_Dev_Design_a_mesmerizing_application_background_wallpaper_3"
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {}
    open func configureConstraint() {}
    open func configureTargets() {}
}
