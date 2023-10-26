import UIKit

public protocol SMMovieCarouselDelegate: AnyObject {
    func selectedIndex(_ index: Int)
}

public enum SMMovieCarouselStyle {
    case image(dataSource: [SMImageViewDataSource])
    case announcement(dataSource: [SMAnnouncementViewDataSource])
}

public final class SMMovieCarouselView: UIView {

    private var collectionView: UICollectionView?
    private var style: SMMovieCarouselStyle
    public weak var delegate: SMMovieCarouselDelegate?

    public init(style: SMMovieCarouselStyle) {
        self.style = style

        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        backgroundColor =  .clear

        let layout = UICollectionViewFlowLayout()

        switch style {
        case .image:
            layout.minimumLineSpacing = 8
            layout.itemSize = CGSize(width: 112, height: 168)
            smc.height(168)
        case .announcement:
            layout.minimumLineSpacing = 16
            layout.itemSize = CGSize(width: 206, height: 204)
            smc.height(204)
        }

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: .zero,
                                           left: 24,
                                           bottom: .zero,
                                           right: 24)

        setupCollectionView(layout)

        guard let collectionView = collectionView else { return }

        addSubviews([collectionView], constraints: true)
        
        smc
            .leading()
            .trailing()
        
        collectionView.smc
            .trailing()
            .leading()
            .top()
            .bottom()

    }

    private func setupCollectionView(_ layout: UICollectionViewFlowLayout) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView?.register(SMImageViewCell.self,
                                 forCellWithReuseIdentifier: SMImageViewCell.reuseIdentifier)
        collectionView?.register(SMAnnouncementViewCell.self,
                                 forCellWithReuseIdentifier: SMAnnouncementViewCell.reuseIdentifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.isPagingEnabled = false
        collectionView?.backgroundColor = .clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
    }

    public func setDataSource(style: SMMovieCarouselStyle) {
        self.style = style
        collectionView?.reloadData()
    }
}

extension SMMovieCarouselView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch style {
        case .image(let dataSource):
            return dataSource.count
        case .announcement(let dataSource):
            return dataSource.count
        }
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch style {
        case .image(let dataSource):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SMImageViewCell.reuseIdentifier,
                for: indexPath
            ) as? SMImageViewCell else { return UICollectionViewCell() }
            cell.setup(dataSource[indexPath.row])
            return cell
        case .announcement(let dataSource):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SMAnnouncementViewCell.reuseIdentifier,
                for: indexPath
            ) as? SMAnnouncementViewCell else { return UICollectionViewCell() }
            cell.setup(dataSource[indexPath.row])
            return cell
        }
    }
}

extension SMMovieCarouselView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedIndex(indexPath.row)
    }
}
