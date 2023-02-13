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
        label.text = "Continue Watching  >"
        label.tintColor = .white
        return label
    }()
    
}

extension HomeView: ViewCode {
    func buildHierarchy() {
        
        self.addSubview(mainImageView)
        self.addSubview(watchingLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 490),
            
            watchingLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 80),
            watchingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
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
