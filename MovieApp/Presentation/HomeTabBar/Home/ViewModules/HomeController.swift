//
//  ViewController.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 24.12.24.
//

import UIKit

final class HomeController: BaseViewController {
    private let viewModel: HomeViewModel
    
    private (set) lazy var collectionView: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.minimumLineSpacing = 12
        l.minimumInteritemSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout:l)
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(cell: MovieCell.self)
        cv.register(cell: TrandingSectionCell.self)
        cv.register(header: SectionHeader.self)
//        cv.register(SectionHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: "SectionHeader")
        cv.backgroundColor = .clear
        cv.refreshControl = refreshControl
        return cv
    }()
    
    private lazy var refreshControl = UIRefreshControl().withUsing {
        $0.addTarget(self, action: #selector(reloadPage), for: .valueChanged)
    }
    
    private lazy var loadingView = UIActivityIndicatorView().withUsing {
        $0.style = .large
        $0.color = .blue
    }
    
    private let layout: HomeCollectionLayout
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.layout = HomeCollectionLayout()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        viewModel.type = .day
        // Do any additional setup after loading the view.
    }
    
    override func configureView() {
        view.addSubViews(loadingView,collectionView)
        configureCompositionalLayout()
    }
    
    override func configureConstraint() {
        collectionView.fillSuperview()
        loadingView.fillSuperview()
    }
    
    private func configureViewModel() {
        viewModel.requestCallBack = { [weak self] state in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch state {
                    case .loading:
                        self.loadingView.startAnimating()
                    case .loaded:
                        self.loadingView.stopAnimating()
                        self.refreshControl.endRefreshing()
                    case .successTranding:
                        self.collectionView.reloadSections(.init(arrayLiteral: 1))
                    case .error(let error):
                        self.showMessage(title: "Xeta", message: error)
                }
            }
        }
    }
    
    @objc
    private func reloadPage() {
        viewModel.type = .day
    }
}

//MARK: UICollectionViewCompositionalLayout
extension HomeController {
    
    fileprivate func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            guard let self = self else {return nil}
            switch sectionIndex {
                case 0 : return self.layout.trandingSegmentSection()
                default: return self.layout.trandingSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}


//MARK: UICollectionViewDelegate
extension HomeController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            switch section {
                case 0: return 1
                case 1 : return viewModel.getTrandingCount()
                default: return 1
            }
        }
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int { 4 }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
                case 0:
                    let cell: TrandingSectionCell = collectionView.dequeue(for: indexPath)
                    cell.delegate = self
                    return cell
                case 1:
                    let cell: MovieCell = collectionView.dequeue(for: indexPath)
                    guard let item = viewModel
                        .getTrandingMovie(index: indexPath.item) else {
                        return UICollectionViewCell()
                    }
                    cell.configureCell(model: item)
                    return cell
                default:
                    let cell: MovieCell = collectionView.dequeue(for: indexPath)
                    return cell
            }
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            print(#function, indexPath.section, indexPath.item)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header: SectionHeader = collectionView.dequeue(header: SectionHeader.self, for: indexPath)
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        return header
        

    }
}

extension HomeController: TrandingSectionCellProtocol {
    func didClickSegment(index: Int) {
        viewModel.type = index == 0 ? .day : .week
        print(#function, index)
    }
}

