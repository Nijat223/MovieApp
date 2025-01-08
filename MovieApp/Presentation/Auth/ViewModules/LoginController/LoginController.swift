//
//  LoginController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import UIKit
final class LoginController: BaseViewController {
    private let viewModel: LoginViewModel
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView ()
        image.image = UIImage(named: "movie-background-collage_23-2149876024")
        image.layer.zPosition = -1
        return image
        
    } ()
    
    private lazy var emailField = UITextField().withUsing {
        $0.placeholder = "Email"
        $0.backgroundColor = .white
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
        $0.delegate = self
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.anchorSize(.init(width: 0, height: 48))
    }
    
    private lazy var passField = UITextField().withUsing {
        $0.placeholder = "Password"
        $0.backgroundColor = .white
        $0.setLeftPadding(10)
        $0.layer.cornerRadius = 10
        $0.delegate = self
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.anchorSize(.init(width: 0, height: 48))
    }
    
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [emailField, passField])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    private lazy var loginButton = UIButton().withUsing {
        $0.setTitle("Login", for: .normal)
        $0.layer.cornerRadius = 10
        $0.anchorSize(.init(width: 0, height: 48))
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .systemBlue
    }
    
    private lazy var registerButton = UIButton().withUsing {
        $0.setTitle("Register", for: .normal)
        $0.layer.cornerRadius = 10
        $0.anchorSize(.init(width: 0, height: 48))
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .systemBlue
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
    
    private lazy var ButtonStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [loginButton, registerButton])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTargets()
        configureConstraint()
        configureViewModel()
       
        
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(stackView, ButtonStackView, imageView)
    }
    
    override func configureConstraint() {
        imageView.fillSuperview()
        super.configureConstraint()
        stackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: .init(top: 280, leading: 24 , trailing: -24))
        
        
        ButtonStackView.anchor(
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 24)
        )
    }
    
    override func configureTargets() {
        super.configureTargets()
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)

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
                viewModel.showHome()
            case .error(let error):
                showMessage(message: error)
            }
        }
    }
    @objc
    private func loginButtonClicked() {
        guard let email = emailField.text,
              let pass = passField.text else {return}
        viewModel.loginRequest(email: email, password: pass)
    }
    
    @objc private func registerButtonClicked() {
//        print(#function)
        viewModel.showRegister()
//        guard let email = emailField.text,
//              let pass = passField.text else {return}
//        viewModel.registerRequest(email: email, password: pass)
        
    }
    
}

extension LoginController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //        guard let text = textField.text else {return}
        //        switch textField {
        //        case emailField:
        //            print("Email:", text)
        //        case passField:
        //            print("pass:", text)
        //        default: return
        //        }
//        
//        guard let email = emailField.text else {return}
//        if email.count < 4 {
//            showMessage()
//        } else {
//            
//        }
        
    }
}
