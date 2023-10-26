import UIKit

class SMMovieViewCell: UICollectionViewCell {
    static var reuseIdentifier: String { String(describing: self) }
}

final class SMImageViewCell: SMMovieViewCell {

    func setup(_ dataSource: SMImageViewDataSource) {
        let cardView = SMImageView(dataSource: dataSource)

        cardView.smc
            .centerX()
            .centerY()
    }
}

final class SMAnnouncementViewCell: SMMovieViewCell {
    var cardView: SMAnnouncementView?
    
    func setup(_ dataSource: SMAnnouncementViewDataSource) {
        cardView = SMAnnouncementView(dataSource: dataSource)

        cardView?.smc
            .centerX()
            .centerY()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardView?.removeFromSuperview()
        cardView = nil
    }
}
