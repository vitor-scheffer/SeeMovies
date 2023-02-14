//
//  HomeCollectionViewCell.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 14/02/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieImage: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "bgHome")
        return view
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    public func setupCell(title: String) {
        self.movieTitle.text = title
        
        setupView()
    }
}

extension MovieCollectionViewCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 80),
            movieImage.heightAnchor.constraint(equalToConstant: 150),
            
            
            movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 12),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ])
    }
    
    func applyAdditionalChanges() {}
    
}

#if DEBUG
import SwiftUI

struct MovieCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        
        return MovieCollectionViewCell().showPreview()
    }
}
#endif
