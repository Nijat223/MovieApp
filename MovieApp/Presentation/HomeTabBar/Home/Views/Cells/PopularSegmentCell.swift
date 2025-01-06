//
//  PopularSegmentCell.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 06.01.25.

import UIKit

final class PopularSegmentCell: UICollectionViewCell {
 
    private lazy var lineView = UIView().withUsing {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "Popular"
        $0.textColor = .black 
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
    }
       
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleLabel, lineView])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 4
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        titleLabel.heightAnchor.constraint(
            equalTo: heightAnchor, multiplier: 0.85)
        .isActive = true
        stackView.fillSuperview()
    }

        
    }
