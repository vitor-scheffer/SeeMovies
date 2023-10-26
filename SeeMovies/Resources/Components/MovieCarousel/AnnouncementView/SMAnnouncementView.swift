import UIKit

public final class SMAnnouncementView: UIView {
    private let imageView = UIImageView()
    private let labelTitle = SMLabel(.bold16)
    private let labelDescription = SMLabel(.bodySmaller)
    private let dataSource: SMAnnouncementViewDataSource

    public init(dataSource: SMAnnouncementViewDataSource) {
        self.dataSource = dataSource

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) { return nil }

    public override func didMoveToSuperview() {
        imageView.setSize(width: 112, height: 104)
        imageView.contentMode = .center

        imageView.setImage(dataSource.image)
        labelTitle.text = dataSource.title
        labelDescription.text = dataSource.description

        addSubviews([imageView, labelTitle, labelDescription], constraints: true)
        
        imageView.smc
            .top()
            .centerX()
        
        labelTitle.smc
            .bottom(labelDescription.topAnchor, 4)
            .leading(imageView.leadingAnchor, 8)
        
        labelDescription.smc
            .top(imageView.bottomAnchor, 4)
            .leading(imageView.leadingAnchor, 8)
    }
}

public struct SMAnnouncementViewDataSource: Equatable {
    let image: UIImage
    let title: String
    let description: String?

    public init(
        image: UIImage,
        title: String,
        description: String? = nil
    ) {
        self.image = image
        self.title = title
        self.description = description
    }
}
