//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 27.01.25.
//

import UIKit
final class MovieDetailController: BaseViewController {
    
    private lazy var movieImage = UIImageView().withUsing {
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "Poster")
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "Better Call Saul"
        $0.textColor = .blue
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [movieImage, titleLabel])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    private let viewModel: MovieDetailViewModel

    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(stackView)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        stackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 24)
        )
        
    }
    
    override func configureTargets() {
        super.configureTargets()
//        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
//        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)

    }
    
    private func configureViewModel() {
        viewModel.requestCallBack = {[weak self] state in
            guard let self = self else {return}
            switch state {
            case .loading:
                print(state)
            case .loaded:
                print(state)
            case .success:
                break
            case .error(let error):
                showMessage(message: error)
            }
        }
    }
    @objc
    private func loginButtonClicked() {
        
    }
    
}
