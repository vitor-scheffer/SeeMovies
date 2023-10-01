//
//  HomeView.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bgHome")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var watchingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = I18n.Home.continueWatching.text
        label.tintColor = .white
        return label
    }()
    
    lazy var movieCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 62, height: 122)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.sectionInset = UIEdgeInsets.zero
        
        let view = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        view.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        return view
    }()
}

extension HomeView: ViewCode {
    func buildHierarchy() {
        
        self.addSubview(mainImageView)
        self.addSubview(watchingLabel)
        self.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            
            watchingLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            watchingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            movieCollectionView.topAnchor.constraint(equalTo: watchingLabel.bottomAnchor, constant: 5),
            movieCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            movieCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            movieCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func applyAdditionalChanges() {
        self.backgroundColor = .black
    }
}

#if DEBUG
import SwiftUI

struct HomeView_Provider: PreviewProvider {
    static var previews: some View {
        
        return HomeView().showPreview()
    }
}
#endif
